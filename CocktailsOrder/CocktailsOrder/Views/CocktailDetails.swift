//
//  CocktailDetails.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 01.08.2022.
//

import SwiftUI

struct CocktailDetails: View {
    @EnvironmentObject var cocktailVM: CocktailViewModel
    var cocktail: CocktailObject
    @State private var isLiked: Bool

    init(cocktail: CocktailObject) {
        self.cocktail = cocktail
        _isLiked = State(initialValue: cocktail.isAddedToMyList)
    }
    
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
            HStack {
                Text(cocktail.strDrink ?? "")
                Spacer()
                LikeButton(isLiked: isLiked)
                    .onTapGesture {
                        isLiked.toggle()
                        cocktailVM.updateCocktailToMyList(cocktail: cocktail)
                    }
            }
            Text("Ingredients")
                .font(.title2)
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Ingredient1")
            }
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Ingredient2")
            }
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Ingredient3")
            }
            Spacer()
        }
    }
}
