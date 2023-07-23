//
//  Cocktail.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 27.07.2022.
//

import Foundation

class Cocktail: Codable, Identifiable {
    var id: String?
    var strDrink: String?
    var strDrinkThumb: String?
    var isAddedToMyList: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case strDrink, strDrinkThumb
    }
    
    convenience init(cocktail: CocktailObject) {
        self.init()
        id = cocktail.strId
        strDrink = cocktail.strDrink
        strDrinkThumb = cocktail.strDrinkThumb
        isAddedToMyList = cocktail.isAddedToMyList
    }
}
