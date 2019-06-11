//
//  Service.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/11/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import SwiftUI
import Combine

public class Service: BindableObject {

    public var didChange = PassthroughSubject<Service, Never>()

    public var isLoading: Bool {
        didSet {
            didChange.send(self)
        }
    }
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
    private let isMock: Bool

    public init(isMock: Bool = false) {
        self.isMock = isMock
        self.isLoading = false
        self.characterData = CharacterData()
        self.session = URLSession.shared
    }

    deinit {
        cancellable?.cancel()
    }

    public func characters() {
        isLoading = true

        if isMock {
            characterData = Service.data
            return
        }

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

    public static var data: CharacterData {
        return LoadMock.load("characters.json")
    }

    public static var mock: [Character] {
        return data.results
    }
}
#endif
