//
//  Cocktail.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 27.07.2022.
//

import Foundation

struct Cocktail: Codable, Identifiable {
    var id: String?
    let idDrink: String?
    var strDrink: String?
    var strDrinkThumb: String?
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var isAddedToMyList: Bool? = false
}
