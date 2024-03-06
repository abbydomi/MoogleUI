//
//  CharacterAPIClient.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 6/3/24.
//

import Foundation

class CharacterAPIClient: BaseAPIClient {
    
    func getCharacter() async throws -> Data {
        let path = "characters/"
        return try await request(path).0
    }
}
