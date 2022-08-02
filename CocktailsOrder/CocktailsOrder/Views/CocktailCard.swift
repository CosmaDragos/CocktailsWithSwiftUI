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
            AsyncImage(url: URL(string: cocktail.strDrinkThumb ?? "")) { image in
                image.resizable()
                    .cornerRadius(15)
                    .frame(width: 180, height: 120)
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("cocktail_logo")
            }
            HStack {
                Text(cocktail.strDrink ?? "")
                    .foregroundColor(.black)
                Spacer()
                if cocktail.isAddedToMyList {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.black)
                } else {
                    Image(systemName: "heart")
                        .foregroundColor(.black)
                }
            }
        }
    }
}
