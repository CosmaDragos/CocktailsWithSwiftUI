//
//  APICall.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 14.03.2023.
//

import Foundation

/// Represents the structure of an endpoint.
protocol APICall {
    var path: String { get }
    var method: APIMethod { get }
    var headers: [String: String]? { get }
    var queryItems: [String: String]? { get }
    func body() throws -> Data?
}

extension APICall {
    func urlRequest(baseURL: String) throws -> URLRequest {
        guard var urlComponents = URLComponents(string: baseURL + path) else {
            throw APIError.invalidURL
        }
        if let queryDict = queryItems {
            urlComponents.queryItems = queryDict.map { key, value in
                URLQueryItem(name: key, value: value)
            }
        }
        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = try body()

        return request
    }
}

/// Default values for an endpoint.
extension APICall {
    var method: APIMethod {
        .get
    }

    var headers: [String: String]? {
        ["Accept": "application/json",
         "Content-Type": "application/json"]
    }

    var queryItems: [String: String]? {
        nil
    }

    func body() throws -> Data? {
        nil
    }
}
