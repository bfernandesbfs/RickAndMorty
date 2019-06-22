//
//  Foundation.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 22/06/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import Combine
import Foundation

public class Provider<Model: Decodable>: Publisher {
    
    public typealias Output = Model
    public typealias Failure = Error
    
    private let session: URLSession
    private let router: Router
    
    public init(with router: Router) {
        let configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: configuration)
        self.router = router
    }
    
    public func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
        
        session.request(router)
            .map { $0.0 }
            .decode(type: Model.self, decoder: JSONDecoder())
            .receive(subscriber: subscriber)
    }

}
