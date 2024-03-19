//
//  GameAPIClient.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 19/3/24.
//

import Foundation

class GameAPIClient: BaseAPIClient {
    
    func getGames() async throws -> Data {
        let path = "games/"
        return try await request(path).0
    }
}
