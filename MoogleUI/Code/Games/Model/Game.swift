//
//  Game.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 19/3/24.
//

import Foundation

struct Game: Codable {
    let gameID, title: String
    let picture: String
    let platform, releaseDate, description: String

    enum CodingKeys: String, CodingKey {
        case gameID = "gameId"
        case title, picture, platform, releaseDate, description
    }
}
