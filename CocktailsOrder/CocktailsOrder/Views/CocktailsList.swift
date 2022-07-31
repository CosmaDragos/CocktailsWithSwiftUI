//
//  CocktailsList.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 30.07.2022.
//

import SwiftUI

struct CocktailsList: View {
    @EnvironmentObject var modelData: CocktailModelData
    @State private var searchText = ""
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(searchResults, id: \.self) { cocktail in
                        CocktailCard(cocktail: cocktail)
                    }
                }
                .searchable(text: $searchText)
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("cocktail_logo")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
        }
        .onAppear(perform: modelData.fetchCocktails)
    }
    
    var searchResults: [Cocktail] {
        if searchText.isEmpty {
            return modelData.cocktails
        } else {
            return modelData.cocktails.filter { $0.strDrink!.contains(searchText) }
        }
    }
}