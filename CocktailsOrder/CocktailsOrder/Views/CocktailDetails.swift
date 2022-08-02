//
//  CocktailDetails.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 01.08.2022.
//

import SwiftUI

struct CocktailDetails: View {
    @EnvironmentObject var modelData: CocktailModelData
    var cocktail: Cocktail
    
    var cocktailIndex: Int {
        modelData.cocktails.firstIndex(where: { $0.id == cocktail.id })!
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
            Spacer()
            HStack {
                Text(cocktail.strDrink ?? "")
                Spacer()
                LikeButton(isSet: $modelData.cocktails[cocktailIndex].isAddedToMyList)
            }
            VStack {
                Text("Ingredients")
                    .font(.title2)
                Text("-Incredient1")
                Text("-Incredient2")
                Text("-Incredient3")
            }
           
        }
    }
}
