//
//  ApiRouter.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 22/06/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import Foundation

public protocol Router {
    var method: String { get }
    var path: String { get }
    var request: URLRequest { get }
}

public enum ApiRouter: Router {
    case all
    case image(String)
    
    public var method: String {
        return "GET"
    }
    
    public var path: String {
        switch self {
        case .all:
            return "/character/"
        case .image(let url):
            return url
        }
    }
    
    public var request: URLRequest {
        
        var url = URL(string: "https://rickandmortyapi.com/api")!.appendingPathComponent(path)
        
        if case .image(let value) = self {
            url = URL(string: value)!
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    }
}

