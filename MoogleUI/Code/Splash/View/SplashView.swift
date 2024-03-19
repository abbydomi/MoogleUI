//
//  SplashView.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 8/3/24.
//

import SwiftUI
import Combine

struct SplashView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var networMonitor: NetworkMonitor
    @State private var isConnected = false
    @State private var isAlertShown = false
    @State private var cancellables = Set<AnyCancellable>()
    @State private var isNext = false
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            ZStack {
                Color.moogle.accent
                    .ignoresSafeArea()
                Circle()
                    .padding()
                    .foregroundStyle(Color.moogle.text)
                Image("moogle")
                    .resizable()
                    .scaledToFit()
                    .padding(70)
            }
            //.onAppear(perform: bind)
            // TODO: Better alerts
            .alert("Error", isPresented: $isAlertShown) {
            } message: {
                Text("alertMessage")
            }
            .navigationDestination(isPresented: $isNext) {
                CharacterView()
            }
        }
    }
}

// MARK: - Bind

private extension SplashView {
    func bind() {
        networMonitor.$isConnected.sink { value in
            handle(value)
        }
        .store(in: &cancellables)
    }
    
    func handle(_ value: Bool) {
        isConnected = value
        if isConnected {
            isNext = true
        } else {
            isAlertShown = true
        }
    }
}

// MARK: - Previews

#Preview {
    SplashView()
}
