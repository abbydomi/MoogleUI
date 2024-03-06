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
    
    func getCharacter() async -> [Character]? {
        do {
            let decoder = JSONDecoder()
            return try await decoder.decode([Character].self, from: characterApiClient.getCharacter())
        } catch {
            // TODO: Proper error handling
            print(error.localizedDescription)
            return nil
        }
    }
}
