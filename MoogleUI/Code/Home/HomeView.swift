//
//  HomeView.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 19/3/24.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    // MARK: - Properties
    
    @State private var viewModel =  HomeViewModel()
    @State private var cancellables = Set<AnyCancellable>()
    @State private var carouselGames: [Game] = []
    
    // MARK: - View
    
    var body: some View {
        VStack {
            Text("MoogleUI") // TODO: Localization
                .titleStyle()
            GameCarousell(games: $carouselGames)
            Spacer()
        }
        .background {
            Color.moogle.background
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
        .onAppear(perform: bind)
    }
}

private extension HomeView {
    func bind() {
        viewModel.getState().sink { state in
            switch state {
            case .loading:
                break
            case .success(let games):
                self.carouselGames = games
            case .failure(_):
                print("oh no")
                break // TODO: Error handling
            }
        }
        .store(in: &cancellables)
    }
}

// MARK: - Games carousel

struct GameCarousell: View {
    
    @Binding var games: [Game]
    
    var body: some View {
        VStack {
            HStack {
                Text("Games")
                    .foregroundStyle(Color.moogle.text)
                    .font(.title2)
                    .bold()
                    .padding(.top)
                    .padding(.horizontal)
                Spacer()
            }
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(games) { game in
                        VStack {
                            Group {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 100)
                                        .foregroundStyle(Color.moogle.text)
                                    AsyncImage(url: URL(string: game.picture)) { image in
                                        image
                                            .image?.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .padding()
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
}
