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
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var isAddedToMyList: Bool? = false
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case strDrink, strDrinkThumb, strIngredient1, strIngredient2, strIngredient3
    }
}
