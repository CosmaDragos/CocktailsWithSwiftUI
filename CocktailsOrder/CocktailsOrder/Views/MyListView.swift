//
//  MyListView.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 01.08.2022.
//

import SwiftUI

struct MyListView: View {
    @EnvironmentObject var cocktailViewModel: CocktailViewModel
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var myCocktails: [CocktailObject] {
        cocktailViewModel.getMyCocktailsList()
    }
        
    var body: some View {
        NavigationView {
            VStack {
                if myCocktails.isEmpty {
                    Text("You don't have any cocktails in your list")
                        .font(.title2)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(myCocktails) { cocktail in
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
}
