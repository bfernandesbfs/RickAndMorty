//
//  CharacterData.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/9/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import Foundation

public struct CharacterData {
    public let info: Info
    public let results: [Character]
}

public struct Info {
    public let count: Int
    public let pages: Int
    public let next: String
    public let prev: String
}
