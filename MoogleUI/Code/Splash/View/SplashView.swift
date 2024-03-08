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
            VStack {
                ZStack {
                    Color.moogle.background
                        .ignoresSafeArea()
                    Circle()
                        .padding()
                        .foregroundStyle(Color.moogle.secondary)
                    Image("moogle")
                        .resizable()
                        .scaledToFit()
                        .padding(70)
                }
                ZStack {
                    Color.moogle.secondary
                        .ignoresSafeArea()
                        .frame(height: 60)
                    ProgressView()
                        .controlSize(.large)
                        .padding(.top)
                }
                .padding(-20)
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
