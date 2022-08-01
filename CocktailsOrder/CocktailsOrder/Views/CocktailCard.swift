//
//  CocktailCard.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 30.07.2022.
//

import SwiftUI

struct CocktailCard: View {
    @State var cocktail: Cocktail
    @State var isLiked = false
    
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
        }
    }
}
