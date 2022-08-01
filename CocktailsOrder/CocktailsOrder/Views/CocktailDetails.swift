//
//  CocktailDetails.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 01.08.2022.
//

import SwiftUI

struct CocktailDetails: View {
    @State var cocktail: Cocktail
    @State var isLiked = false
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: cocktail.strDrinkThumb ?? "")) { image in
                image.resizable()
                    .padding([.top, .leading, .trailing], 0)
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("cocktail_logo")
            }
            Spacer()
            HStack {
                Text(cocktail.strDrink ?? "")
                Spacer()
                Button {
                    cocktail.isAddedToMyList?.toggle()
                    self.isLiked.toggle()
                } label: {
                    if isLiked || cocktail.isAddedToMyList ?? false {
                        Image(systemName: "heart.fill")
                    } else {
                        Image(systemName: "heart")
                    }
                }
            }
            VStack {
                Text("Ingredients")
                    .font(.title2)
                Text(cocktail.strIngredient1 ?? "")
                Text(cocktail.strIngredient2 ?? "")
                Text(cocktail.strIngredient3 ?? "")
            }
           
        }
    }
}
