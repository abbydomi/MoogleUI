//
//  HomeViewModel.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 19/3/24.
//

import Foundation
import Combine

class HomeViewModel {
    
    // MARK: - Properties
    
    private let state: CurrentValueSubject<HomeState, Never>  = .init(.loading)
    private var cancellables = Set<AnyCancellable>()
    
    private let gameDataManager = GameDataManager()
    private var games: [Game] = []
    
    // MARK: - Lifecycle
    
    init() {
        self.getGames()
    }
    
    func getState() -> AnyPublisher<HomeState, Never> {
        state.eraseToAnyPublisher()
    }
}

// MARK: Private Methods

private extension HomeViewModel {
    
    func getGames() {
        // TODO: Localization
        Task {
            do {
                try self.games = await gameDataManager.getGames() ?? []
                state.send(.success(games))
            } catch MoogleError.badResponse {
                state.send(.failure(("400 - Bad response")))
            } catch MoogleError.notFound {
                state.send(.failure(("404 - Not Found")))
            } catch MoogleError.serviceDown {
                state.send(.failure(("522 - Bad response")))
            } catch MoogleError.unkownError {
                state.send(.failure(("An Unknown error ocurred")))
            } catch {
                state.send(.failure(("An Unknown error ocurred")))
            }
            
        }
    }
}

enum HomeState {
    case loading
    case success([Game])
    case failure(String)
}
