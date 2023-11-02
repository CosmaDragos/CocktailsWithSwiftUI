//
//  CocktailsService.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 14.03.2023.
//

import Foundation

protocol CocktailsServiceable: NetworkServiceable {
    func fetchCocktails() async throws -> [Cocktail]
}

// MARK: - Real Service

struct CocktailsService: CocktailsServiceable {
    let baseURL: String

    func fetchCocktails() async throws -> [Cocktail] {
        try await call(endpoint: API.cocktails)
    }
}

// MARK: - Stub Service

struct StubCocktailsService: CocktailsServiceable {

    func fetchCocktails() async throws -> [Cocktail] {
       return []
    }
}
