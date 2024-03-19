//
//  HomeView.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 19/3/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("MoogleUI") // TODO: Localization
                .titleStyle()
            Spacer()
            GameCarousell()
        }
        .background {
            Color.moogle.background
                .ignoresSafeArea()
        }
    }
}

// MARK: - Games carousel

struct GameCarousell: View {
    var body: some View {
        HStack {
            Text("Games")
                .foregroundStyle(Color.moogle.text)
                .font(.title2)
            Spacer()
        }
        .padding(20)
    }
}

#Preview {
    HomeView()
}
