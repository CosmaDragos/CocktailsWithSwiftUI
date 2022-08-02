//
//  MyListView.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 01.08.2022.
//

import SwiftUI

struct MyListView: View {
    @EnvironmentObject var modelData: CocktailModelData
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                if myListOfCocktails.isEmpty {
                    Text("You don't have any cocktails in your list")
                        .font(.title2)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(myListOfCocktails) { cocktail in
                                CocktailCard(cocktail: cocktail)
                            }
                        }
                        .padding()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("cocktail_logo")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
        }
    }
    
    var myListOfCocktails: [Cocktail] {
        return modelData.cocktails.filter { $0.isAddedToMyList }
    }
}
