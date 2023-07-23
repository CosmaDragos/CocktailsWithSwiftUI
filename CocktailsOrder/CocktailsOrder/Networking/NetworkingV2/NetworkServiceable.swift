//
//  NetworkServiceable.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 14.03.2023.
//

import Foundation

protocol NetworkServiceable {
    var session: URLSession { get }
    var baseURL: String { get }
}

extension NetworkServiceable {

    /// Main function for calling an endpoint.
    /// - Parameter endpoint: Provided from a predefined API enumeration.
    /// - Returns: The decoded model or a custom error.
    func call<T: Decodable>(endpoint: APICall) async throws -> T {
        guard let request = try? endpoint.urlRequest(baseURL: baseURL) else {
            throw APIError.invalidURL
        }
        do {
            let (data, response) = try await session.data(for: request)
            print("Received data:", String(data: data, encoding: .utf8) ?? "Invalid data")
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                throw APIError.unexpectedResponse
            }
            guard 200 ..< 300 ~= statusCode else {
                throw APIError.httpCode(statusCode)
            }
            let decodedResponse = try JSONDecoder().decode(CocktailsResponse.self, from: data)
            return decodedResponse.drinks as! T
        } catch let error {
            throw error as? APIError ?? APIError.unknown
        }
    }
}

/// Default values used when we create stub services.
extension NetworkServiceable {
    var session: URLSession {
        URLSession(configuration: URLSessionConfiguration.default)
    }

    var baseURL: String {
        ""
    }
}

