//
//  CocktailsStore.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 14.03.2023.
//

import Combine
import Foundation

final class CocktailViewModel: ObservableObject {

    // MARK: - State Properties

    @Published private(set) var state: ViewState = .empty

    // MARK: - Public Properties
    
    private var cocktails: [Cocktail] = []

    // MARK: - Private Properties

    private let cocktailsService: CocktailsServiceable
    var searchText = ""

    // MARK: - Lifecycle

    init(cocktailsService: CocktailsServiceable) {
        self.cocktailsService = cocktailsService
    }

    // MARK: - API Calls
    
    func fetchCocktails() async {
        do {
            let _ = try await cocktailsService.fetchCocktails()
            await MainActor.run {
                self.state = cocktails.isEmpty ? .empty : .loaded
                self.cocktails = cocktails
            }
        } catch let error as APIError {
            await MainActor.run {
                self.state = .failed(error)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func getCocktailId(cocktail: Cocktail) -> Int {
        cocktails.firstIndex(where: { $0.id == cocktail.id })!
    }
    
    var searchResults: [Cocktail] {
        if searchText.isEmpty {
            return cocktails
        } else {
            return cocktails.filter { $0.strDrink!.contains(searchText) }
        }
    }
    
    func addCocktailToMyList(cocktailIndex: Int) -> Bool {
        return self.cocktails[cocktailIndex].isAddedToMyList
    }
    
    func getMyCocktailsList() -> [Cocktail] {
        return cocktails.filter { $0.isAddedToMyList }
    }
}
