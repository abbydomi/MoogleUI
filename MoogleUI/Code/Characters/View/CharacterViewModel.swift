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
    var cancellables = Set<AnyCancellable>()
    
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
        Task {
            self.characters = await characterDataManager.getCharacter() ?? []
            print(self.characters)
        }
    }
}

// MARK: - State

enum CharacterState {
    case loading
    case success
    case failure
}
