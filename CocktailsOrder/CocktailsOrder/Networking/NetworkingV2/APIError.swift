//
//  APIError.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 14.03.2023.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case httpCode(Int)
    case unexpectedResponse
    case decode(Error)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case let .httpCode(code):
            switch code {
            case 400:
                return "The server cannot process the request because it is malformed"
            case 401:
                return "The server could not verify that you are authorized to access this"
            case 403:
                return "You don't have permission to access this"
            case 404:
                return "The requested URL was not found on the server"
            case 408:
                return "The request has timed out"
            case 500:
                return "Oops! Something Went Wrong!"
            default:
                return "Unexpected HTTP code: \(code)"
            }
        case .decode(let error):
            return "Decode error with message: \(error)"
        case .unexpectedResponse:
            return "Unexpected response from the server"
        case .unknown:
            return "Oops! Something Went Wrong!"
        }
    }
}

