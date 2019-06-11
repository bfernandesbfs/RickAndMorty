//
//  ServiceRouter.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/11/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import Foundation

public enum ServiceRouter {
    case all

    public var method: String {
        return "GET"
    }

    public var path: String {
        return "/character/"
    }

    public var request: URLRequest {

        let url = URL(string: "https://rickandmortyapi.com/api")!.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }
}
