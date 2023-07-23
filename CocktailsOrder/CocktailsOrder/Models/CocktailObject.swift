//
//  CocktailObject.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 23.07.2023.
//

import RealmSwift

class CocktailObject: Object, ObjectKeyIdentifiable, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var strId: String?
    @Persisted var strDrink: String?
    @Persisted var strDrinkThumb: String?
    @Persisted var isAddedToMyList: Bool = false
    
    convenience init(cocktail: Cocktail) {
        self.init()
        strId = cocktail.id
        strDrink = cocktail.strDrink
        strDrinkThumb = cocktail.strDrinkThumb
        isAddedToMyList = cocktail.isAddedToMyList
    }
}
