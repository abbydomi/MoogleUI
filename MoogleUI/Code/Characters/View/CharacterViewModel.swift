//
//  CharacterViewModel.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 6/3/24.
//

import Foundation
import Combine

class CharacterViewModel {
    
    // MARK: - Properties
    
    private let state: CurrentValueSubject<CharacterState, Never> = .init(.loading)
    private var cancellables = Set<AnyCancellable>()
    
    private let characterDataManager = CharacterDataManager()
    private var characters: [Character] = []
    
    // MARK: - Lifecycle
    
    init() {
        self.getCharacter()
    }
    
    func getState() -> AnyPublisher<CharacterState, Never> {
        state.eraseToAnyPublisher()
    }
    
    func getCharacter() {
        // TODO: Localization
        Task {
            do {
                try self.characters = await characterDataManager.getCharacter() ?? []
                state.send(.success(characters))
            } catch MoogleError.badResponse {
                state.send(.failure(("400 - Bad response")))
            } catch MoogleError.notFound {
                state.send(.failure(("404 - Not Found")))
            } catch MoogleError.serviceDown {
                state.send(.failure(("522 - Bad response")))
            } catch MoogleError.unkownError {
                state.send(.failure(("An Unknown error ocurred")))
            } catch {
                
            }
            
        }
    }
}

// MARK: - State

enum CharacterState {
    case loading
    case success([Character])
    case failure(String)
}
