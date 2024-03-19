//
//  GameDataManager.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 19/3/24.
//

import Foundation

class GameDataManager {
    
    // MARK: - Properties
    
    private let gameApiClient = GameAPIClient()
    
    // MARK: - Init
    /*
     TODO: Proper init and builders
    init(fishApiClient: FishAPIClient) {
        self.fishApiClient = fishApiClient
    }
     */
    
    // MARK: - Public Methods
    
    func getGames() async throws -> [Game]? {
        do {
            let decoder = JSONDecoder()
            return try await decoder.decode([Game].self, from: gameApiClient.getGames())
        } catch MoogleError.badResponse {
            throw MoogleError.badResponse
        } catch MoogleError.notFound {
            throw MoogleError.notFound
        } catch MoogleError.serviceDown {
            throw MoogleError.serviceDown
        } catch MoogleError.unkownError {
            throw MoogleError.unkownError
        } catch {
            throw MoogleError.unkownError
        }
    }
}
