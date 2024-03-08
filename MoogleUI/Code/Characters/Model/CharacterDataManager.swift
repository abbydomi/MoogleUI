//
//  CharacterDataManager.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 6/3/24.
//

import Foundation

class CharacterDataManager {
    
    // MARK: - Properties
    
    private let characterApiClient = CharacterAPIClient()
    
    // MARK: - Init
    /*
     TODO: Proper init and builders
    init(fishApiClient: FishAPIClient) {
        self.fishApiClient = fishApiClient
    }
     */
    
    // MARK: - Public Methods
    
    func getCharacter() async throws -> [Character]? {
        do {
            let decoder = JSONDecoder()
            return try await decoder.decode([Character].self, from: characterApiClient.getCharacter())
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
