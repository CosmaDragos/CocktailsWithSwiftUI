//
//  CocktailsList.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 30.07.2022.
//

import SwiftUI

struct CocktailsList: View {
    @EnvironmentObject var cocktailVM: CocktailViewModel
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(cocktailVM.searchResults) { cocktail in
                        NavigationLink {
                            CocktailDetails(cocktail: cocktail)
                        } label: {
                            CocktailCard(cocktail: cocktail)
                        }
                    }
                }
                .searchable(text: $cocktailVM.searchText)
                .padding()
            }
            .task {
                await cocktailVM.fetchCocktails()
            }
            .refreshable { [weak cocktailVM] in
                await cocktailVM?.fetchCocktails()
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
