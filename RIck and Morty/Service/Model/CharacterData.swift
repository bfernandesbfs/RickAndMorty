//
//  CharacterData.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/9/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import Foundation

public struct CharacterData: Decodable {
    public let info: Info
    public let results: [Character]

    public init() {
        info = Info()
        results = []
    }
}

public struct Info: Decodable {
    public let count: Int
    public let pages: Int
    public let next: String
    public let prev: String

    public init() {
        count = Int()
        pages = Int()
        next = String()
        prev = String()
    }
}
