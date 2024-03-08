//
//  NetworkMonitor.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 8/3/24.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    @Published var isConnected = false
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}
