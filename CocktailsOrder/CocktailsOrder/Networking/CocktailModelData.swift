//
//  CocktailModelData.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 27.07.2022.
//

import Foundation
import Combine

final class CocktailModelData: ObservableObject {
    @Published var cocktails: [Cocktail] = []
    @Published var likedCocktails: [Cocktail] = []
    
    private var bag = Set<AnyCancellable>()

    func fetchCocktails() {
        let cocktailsUrlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
        
        if let url = URL(string: cocktailsUrlString) {
            URLSession.shared
                .dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .map(\.data)
                .decode(type: CocktailsResponse.self, decoder: JSONDecoder())
                .sink { res in
                    switch res {
                    case .failure(let error):
                        print(error)
                    default: break
                    }
                } receiveValue: { cocktailsData in
                    self.cocktails = cocktailsData.drinks ?? []
                }
                .store(in: &bag)
        }
    }
}
