//
//  Service.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/11/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import Foundation
import Combine

public class Service {

    public var didChange = PassthroughSubject<Service, Never>()

    public var isLoading: Bool
    public var characterData: CharacterData {
        didSet {
            updateData()
        }
    }

    private var cancellable: Cancellable? {
        didSet {
            oldValue?.cancel()
        }
    }

    private let session: URLSession

    public init() {
        isLoading = false
        characterData = CharacterData()
        session = URLSession.shared
    }

    deinit {
        cancellable?.cancel()
    }

    public func characters() {
        isLoading = true
        let router = ServiceRouter.all

        cancellable = session.request(router.request)
            .decode(type: CharacterData.self, decoder: JSONDecoder())
            .replaceError(with: CharacterData())
            .assign(to: \.characterData, on: self)
    }

    // MARK: Private Methods

    private func updateData() {

        if !characterData.results.isEmpty {
            isLoading = false
            didChange.send(self)
        }

    }
}

#if DEBUG
extension Service {

    public static var mock: [Character] {
        return LoadMock.load("characters.json")
    }
}
#endif
