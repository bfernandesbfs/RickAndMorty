//
//  Character.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/9/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import SwiftUI

public struct Character: Identifiable, Decodable {

    public let id: Int
    public let name: String
    public let status: Status
    public let species: String
    public let type: String
    public let gender: Gender
    public let origin: Location
    public let location: Location
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String
}
