//
//  CocktailCard.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 30.07.2022.
//

import SwiftUI

struct CocktailCard: View {
    @EnvironmentObject var cocktailVM: CocktailViewModel
    @State private var isLiked: Bool
    var cocktail: CocktailObject
    
    init(cocktail: CocktailObject) {
        self.cocktail = cocktail
        _isLiked = State(initialValue: cocktail.isAddedToMyList)
    }
    
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
                LikeButton(isLiked: isLiked)
                    .onTapGesture {
                        isLiked.toggle()
                        cocktailVM.updateCocktailToMyList(cocktail: cocktail)
                    }
            }
        }
    }
}
