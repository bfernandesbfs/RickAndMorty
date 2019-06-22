//
//  Gender.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/9/19.
//  Copyright © 2019 bfs. All rights reserved.
//

public enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}
