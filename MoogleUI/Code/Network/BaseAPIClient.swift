//
//  BaseAPIClient.swift
//  MoogleUI
//
//  Created by Abby Dominguez on 6/3/24.
//

import Foundation

class BaseAPIClient {
    
    private var baseURL: URL {
        if let url = URL(string: Environment.shared.baseURL) {
            return url
        } else {
            // TODO: Proper error handling
            fatalError()
        }
    }
    
    func request(_ relativePath: String?) async throws -> (Data, HTTPURLResponse) {
        let urlAbsolute = baseURL.appendingPathComponent(relativePath!)
        let (data, response) = try await URLSession.shared.data(from: urlAbsolute)
        
        guard let response = response as? HTTPURLResponse else {
            fatalError()
        }
        
        if response.statusCode == 200 {
            return (data, response)
        }
        
        switch response.statusCode {
        case 522: //Service is down
            fatalError()
        case 404: //Not found
            fatalError()
        default: //Unknown error
            fatalError()
        }
    }
}
