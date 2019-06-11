//
//  URLSession+Combine.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/11/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import Foundation
import Combine

public enum NetworkError: Error {
    case responseError
    case parseError(Error)
}

extension URLSession {

    public func request(_ request: URLRequest) -> AnyPublisher<Data, NetworkError> {
        return .init { subscriber in
            let task = self.dataTask(with: request) { data, response, error in
                // This can be replaced with RunLoop integration with Combine framework soon
                DispatchQueue.main.async {
                    guard let httpResponse = response as? HTTPURLResponse,
                        let data = data,
                        200..<300 ~= httpResponse.statusCode else {
                            subscriber.receive(completion: .failure(.responseError))
                            return
                    }

                    _ = subscriber.receive(data)
                    subscriber.receive(completion: .finished)
                }
            }

            subscriber.receive(subscription: ServiceSubscription { task.cancel() })
            task.resume()
        }
    }
}

extension JSONDecoder: TopLevelDecoder {}
