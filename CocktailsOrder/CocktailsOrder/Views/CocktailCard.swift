//
//  CocktailCard.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 30.07.2022.
//

import SwiftUI

struct CocktailCard: View {
    var cocktail: Cocktail
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: cocktail.strDrinkThumb ?? ""))
            //            Image("cocktail_logo")
            Spacer()
            HStack {
                
                Text(cocktail.strDrink ?? "")
                
                Spacer()
                
                if cocktail.isAddedToMyList ?? false {
                    Image(systemName: "heart.fill")
                    
                }
                //            Image(systemName: "heart.fill")
            }
        }
        .frame(width: 150, height: 150)
        .cornerRadius(15)
    }
}
