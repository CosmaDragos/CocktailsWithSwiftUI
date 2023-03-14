//
//  CocktailsStore.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 14.03.2023.
//

import Combine
import Foundation

protocol CocktailsStoreable: LoadableObject {
    var cocktails: [Cocktail] { get }
    func fetchCocktails() async
}

final class CocktailsStore: CocktailsStoreable {

    // MARK: - State Properties

    @Published private(set) var state: ViewState = .empty

    // MARK: - Public Properties
    
    private(set) var cocktails: [Cocktail] = []

    // MARK: - Private Properties

    private let cocktailsService: CocktailsServiceable

    // MARK: - Lifecycle

    init(cocktailsService: CocktailsServiceable) {
        self.cocktailsService = cocktailsService
    }

    // MARK: - API Calls

    @MainActor
    func fetchCocktails() async {
        let result = await cocktailsService.fetchCocktails()
        switch result {
        case .success(let cocktails):
            state = cocktails.isEmpty ? .empty : .loaded
            self.cocktails = cocktails
        case .failure(let error):
            state = .failed(error)
        }
    }
}
