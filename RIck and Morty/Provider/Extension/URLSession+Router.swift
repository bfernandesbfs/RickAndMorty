//
//  URLSession+Combine.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/11/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import Foundation

extension URLSession {

    internal func request(_ router: Router) -> URLSession.DataTaskPublisher {
        return dataTaskPublisher(for: router.request)
    }
}
