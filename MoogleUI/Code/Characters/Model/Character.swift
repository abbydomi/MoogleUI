//
//  Character.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 6/3/24.
//

import Foundation

// MARK: - Character

struct Character: Codable, Identifiable {
    let id, name: String
    let japaneseName: String?
    let age: String
    let gender: Gender
    let race, job: String
    let height: String?
    let weight: String
    let origin: Origin
    let description: String?
    let pictures: [Picture]
    let stats: [Stat]
}

enum Gender: String, Codable {
    case androgynous = "Androgynous"
    case empty = "??"
    case female = "Female"
    case male = "Male"
}

enum Origin: String, Codable {
    case finalFantasy = "Final Fantasy"
    case finalFantasyBE = "Final Fantasy BE"
    case finalFantasyII = "Final Fantasy II"
    case finalFantasyIII = "Final Fantasy III"
    case finalFantasyIV = "Final Fantasy IV"
    case finalFantasyIX = "Final Fantasy IX"
    case finalFantasyV = "Final Fantasy V"
    case finalFantasyVI = "Final Fantasy VI"
    case finalFantasyVII = "Final Fantasy VII"
    case finalFantasyVIII = "Final Fantasy VIII"
    case finalFantasyX = "Final Fantasy X"
    case finalFantasyX2 = "Final Fantasy X-2"
    case finalFantasyXII = "Final Fantasy XII"
    case finalFantasyXIII = "Final Fantasy XIII"
    case finalFantasyXIII2 = "Final Fantasy XIII-2"
    case finalFantasyXV = "Final Fantasy XV"
}

// MARK: - Picture
struct Picture: Codable {
    let id: String
    let url: String
    let primary: Int
    let collectionID: String

    enum CodingKeys: String, CodingKey {
        case id, url, primary
        case collectionID = "collectionId"
    }
}

// MARK: - Stat
struct Stat: Codable {
    let id, platform: String
    let level: Int
    let statClass: String
    let hitPoints, manaPoints, attack, defense: Int
    let magic, magicDefense, agility, spirit: Int
    let collectionID: String

    enum CodingKeys: String, CodingKey {
        case id, platform, level
        case statClass = "class"
        case hitPoints, manaPoints, attack, defense, magic, magicDefense, agility, spirit
        case collectionID = "collectionId"
    }
}
