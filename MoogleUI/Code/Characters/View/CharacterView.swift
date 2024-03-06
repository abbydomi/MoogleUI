//
//  ContentView.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 6/3/24.
//

import SwiftUI

struct CharacterView: View {
    // MARK: - Properties
    
    private let viewModel = CharacterViewModel()
    
    // MARK: - View
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Moogle!")
        }
        .padding()
    }
}

#Preview {
    CharacterView()
}
