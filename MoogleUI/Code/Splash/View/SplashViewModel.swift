//
//  SplashViewModel.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 19/3/24.
//

import Foundation
import Combine

class SplashViewModel {
    // MARK: - Properties
    
    private let state: CurrentValueSubject<SplashState, Never> = .init(.loading)
    private var cancellables = Set<AnyCancellable>()
    private var character: Character?
    private let characterDataManager = CharacterDataManager()
    
    var networkMonitor: NetworkMonitor?

    // MARK: - Lifecycle
    
    init(networkMonitor: NetworkMonitor) {
        self.networkMonitor = networkMonitor
        bindToNetworkMonitor()
    }
    
    func getState() -> AnyPublisher<SplashState, Never> {
        state.eraseToAnyPublisher()
    }
    
    func bindToNetworkMonitor() {
        networkMonitor?.$isConnected.sink { value in
            if value == true {
                self.getAPIStatus()
            }
        }
        .store(in: &cancellables)
    }
    
    func getAPIStatus() {
        Task {
            do {
                try await self.character = characterDataManager.getCharacter()?.first
                state.send(.success(character))
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

enum SplashState {
    case loading
    case success(Character?)
    case failure(String)
}
