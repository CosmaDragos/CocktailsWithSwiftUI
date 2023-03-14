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
    func call<T: Decodable>(endpoint: APICall) async -> Result<T, APIError> {
        guard let request = try? endpoint.urlRequest(baseURL: baseURL) else {
            return .failure(.invalidURL)
        }
        do {
            let (data, response) = try await session.data(for: request)
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                throw APIError.unexpectedResponse
            }
            guard 200 ..< 300 ~= statusCode else {
                throw APIError.httpCode(statusCode)
            }
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                return .success(decodedResponse)
            } catch let error {
                return .failure(APIError.decode(error))
            }
        } catch let error {
            return .failure(error as? APIError ?? .unknown)
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

