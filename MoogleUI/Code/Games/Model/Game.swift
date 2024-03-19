//
//  Game.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 19/3/24.
//

import Foundation

struct Game: Codable, Identifiable {
    let id, title: String
    let picture: String
    let platform, releaseDate, description: String

    enum CodingKeys: String, CodingKey {
        case id = "gameId"
        case title, picture, platform, releaseDate, description
    }
}
