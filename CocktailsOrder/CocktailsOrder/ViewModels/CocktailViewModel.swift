//
//  CocktailsStore.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 14.03.2023.
//

import Combine
import Foundation
import RealmSwift

final class CocktailViewModel: ObservableObject {
    
    // MARK: - State Properties
    
    @Published private(set) var state: ViewState = .empty
    
    // MARK: - Public Properties
    
    private var cocktails: [Cocktail] = []
    
    // MARK: - Private Properties
    
    private let cocktailsService: CocktailsServiceable
    private var realmManager = RealmManager()

    var searchText = ""
    
    // MARK: - Lifecycle
    
    init(cocktailsService: CocktailsServiceable) {
        self.cocktailsService = cocktailsService
    }
    
    // MARK: - API Calls
    
    func fetchCocktails() async {
        do {
            let cocktails = try await cocktailsService.fetchCocktails()
            await MainActor.run {
                self.cocktails = cocktails
                for cocktail in cocktails {
                    let cocktailObject = CocktailObject(cocktail: cocktail)
                    self.realmManager.addCocktail(cocktail: cocktailObject)
                }
                self.state = cocktails.isEmpty ? .empty : .loaded
            }
        } catch let error as APIError {
            await MainActor.run {
                self.state = .failed(error)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func addCocktailToMyList(cocktail: CocktailObject) {
        self.realmManager.updateCocktail(id: cocktail.id, isAddedToMyList: cocktail.isAddedToMyList)
    }
    
    var searchResults: [CocktailObject] {
        let allCocktailObjects = self.realmManager.cocktails
        if searchText.isEmpty {
            return allCocktailObjects
        } else {
            return allCocktailObjects.filter { $0.strDrink!.contains(self.searchText) }.map(CocktailObject.init)
        }
    }
    
    func getMyCocktailsList() -> [CocktailObject] {
        let cocktails = self.realmManager.cocktails
        return cocktails
    }
}
