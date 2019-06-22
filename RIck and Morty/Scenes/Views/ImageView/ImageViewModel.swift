//
//  ImageViewModel.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 22/06/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import SwiftUI
import Combine

public final class ImageViewModel: BindableObject {

    public var image: UIImage? {
        didSet {
            didChange.send(self)
        }
    }
    
    public let didChange: PassthroughSubject<ImageViewModel, Never>
    private let router: ApiRouter
    private var task: Cancellable?
    
    public init(url: String) {
        didChange = PassthroughSubject<ImageViewModel, Never>()
        router = ApiRouter.image(url)
    }
    
    deinit {
        task?.cancel()
    }
    
    // MARK: Public Methods
    
    public func fetch() {
        
        if let image = ImageCache.shared.image(for: router.path) {
            self.image = image
            return
        }
        
        task = URLSession.shared.request(router)
            .map { UIImage(data: $0.data) }
            .receive(on: RunLoop.main)
            .sink { image in
                self.image = image
                
                if let image = image  {
                    ImageCache.shared.store(image: image, for: self.router.path)
                }
            }
    }
}

public class ImageCache {
    
    public static let shared: ImageCache = ImageCache()
    
    private let cache = NSCache<NSString, UIImage>()
    
    private let queue = DispatchQueue.main
    
    public func store(image: UIImage, for key: String) {
        queue.async { [unowned cache] in
            cache.setObject(image, forKey: key as NSString)
        }
    }
    
    public func image(for key: String) -> UIImage? {
        
        if let cached = self.cache.object(forKey: key as NSString) {
            return cached
        }
        return nil
    }
}
