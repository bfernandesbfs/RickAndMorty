//
//  MainViewModel.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 22/06/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import SwiftUI
import Combine

public enum MainViewState {
    case loading, content, error
}

public final class MainViewModel: BindableObject {
    
    public var characters: [Character] {
        didSet {
            didChange.send(self)
        }
    }
    
    public let didChange: PassthroughSubject<MainViewModel, Never>
    public let didAppear: PassthroughSubject<Void, Never>
    public var state: MainViewState
    
    private let provider: Provider<CharacterData>
    private var task: Cancellable?
    private var isLoading: Bool
    
    public init() {
        state = .loading
        isLoading = false
        characters = []
        didChange = PassthroughSubject<MainViewModel, Never>()
        didAppear = PassthroughSubject<Void, Never>()
        provider = Provider(with: ApiRouter.all)
        configure()
    }
    
    deinit {
        task?.cancel()
    }
    
    // MARK: Private Methods
    
    private func configure() {
        _ = didAppear
            .sink { _ in self.fetch() }
    }
    
    // Request
    
    public func fetch() {
        if isLoading {
            return
        }
        isLoading = true
        
        task = provider
            .sink {
                self.state = .content
                self.isLoading = false
                self.characters = $0.results
        }
    }
}
