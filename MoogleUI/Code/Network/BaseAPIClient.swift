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
            print("URL Invalid")
            return URL(string: "")!
        }
    }
    
    func request(_ relativePath: String?) async throws -> (Data, HTTPURLResponse) {
        let urlAbsolute = baseURL.appendingPathComponent(relativePath!)
        let (data, response) = try await URLSession.shared.data(from: urlAbsolute)
        
        guard let response = response as? HTTPURLResponse else {
            throw MoogleError.badResponse
        }
        
        if response.statusCode == 200 {
            return (data, response)
        }
        
        switch response.statusCode {
        case 522:
            throw MoogleError.serviceDown
        case 404:
            throw MoogleError.notFound
        default:
            throw MoogleError.unkownError
        }
    }
}
