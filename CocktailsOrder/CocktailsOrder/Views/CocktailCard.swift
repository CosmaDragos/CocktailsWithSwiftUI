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
                .frame(width: 180, height: 120)
                .aspectRatio(contentMode: .fill)
            HStack {
                Text(cocktail.strDrink ?? "")
                Spacer()
                if cocktail.isAddedToMyList ?? false {
                    Image(systemName: "heart.fill")
                } else {
                    Image(systemName: "heart")
                }
            }
        }
        .frame(width: 180, height: 180)
        .cornerRadius(15)
    }
}
