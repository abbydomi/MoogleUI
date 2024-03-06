//
//  ContentView.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 6/3/24.
//

import SwiftUI
import Combine

struct CharacterView: View {
    // MARK: - Properties
    
    private let viewModel = CharacterViewModel()
    @State var cancellables = Set<AnyCancellable>()
    @State private var characters: [Character] = []
    
    // MARK: - View
    
    var body: some View {
        VStack {
            Text("MoogleUI")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
            ScrollView {
                LazyVStack {
                    ForEach(characters) { character in
                        HStack {
                            Text("- \(character.name)")
                                .padding(.horizontal)
                            Spacer()
                        }
                    }
                }
            }
        }
        .onAppear {
            responseViewModel()
        }
    }
    
    // MARK: - Private methods
    
    private func responseViewModel() {
        viewModel.getState()
            .sink(receiveValue: { state in
                switch state {
                case .loading:
                   break
                case .success(let characters):
                    self.characters = characters
                case .failure:
                    break
                }
            })
            .store(in: &cancellables)
    }
}

#Preview {
    CharacterView()
}
