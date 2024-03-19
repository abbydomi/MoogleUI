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
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.moogle.text)
                .padding()
        }
        .gradientRadius()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView()
}
