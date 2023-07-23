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
    
    private var cocktails: [CocktailObject] = []
    
    // MARK: - Private Properties
    
    private let cocktailsService: CocktailsServiceable
    private var realmManager = RealmManager()
    
    var searchText = ""
    private var hasFetchedData = false // Add a flag to track if data has been fetched
    
    // MARK: - Lifecycle
    
    init(cocktailsService: CocktailsServiceable) {
        self.cocktailsService = cocktailsService
    }
    
    // MARK: - API Calls
    
    func fetchCocktails() async {
        if !hasFetchedData {
            do {
                let cocktails = try await cocktailsService.fetchCocktails()
                await MainActor.run {
                    for cocktail in cocktails {
                        let cocktailObject = CocktailObject(cocktail: cocktail)
                        self.realmManager.addCocktail(cocktail: cocktailObject)
                    }
                    self.cocktails = self.realmManager.cocktails
                    self.state = cocktails.isEmpty ? .empty : .loaded
                }
                hasFetchedData = true
            } catch let error as APIError {
                await MainActor.run {
                    self.state = .failed(error)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            let cocktailObjects = self.realmManager.cocktails
            await MainActor.run {
                state = cocktailObjects.isEmpty ? .empty : .loaded
            }
        }
    }
    
    func updateCocktailToMyList(cocktail: CocktailObject) {
        if let index = cocktails.firstIndex(where: { $0.id == cocktail.id }) {
            cocktails[index].isAddedToMyList = cocktail.isAddedToMyList
        }
        self.realmManager.updateCocktail(id: cocktail.id, isAddedToMyList: !cocktail.isAddedToMyList)
    }
    
    var filteredCocktails: [CocktailObject] {
        if searchText.isEmpty {
            return cocktails
        } else {
            return cocktails.filter { $0.strDrink?.contains(searchText) ?? false}
        }
    }
    
    func getMyCocktailsList() -> [CocktailObject] {
        let myCocktails = self.realmManager.cocktails.filter {
            $0.isAddedToMyList == true
        }
        return myCocktails
    }
}