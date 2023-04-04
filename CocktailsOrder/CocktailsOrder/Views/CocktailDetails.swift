//
//  CocktailDetails.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 01.08.2022.
//

import SwiftUI

struct CocktailDetails: View {
    @EnvironmentObject var cocktailViewModel: CocktailViewModel
    var cocktail: Cocktail
    @State private var isSet = false
    var cocktailIndex: Int {
        cocktailViewModel.getCocktailId(cocktail: cocktail)
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
                LikeButton(isSet: $isSet)
            }
            Text("Ingredients")
                .font(.title2)
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Incredient1")
            }
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Incredient2")
            }
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        isSet = cocktailViewModel.addCocktailToMyList(cocktailIndex: cocktailIndex)
                    }
                Text("Incredient3")
            }
            Spacer()
        }
    }
}

