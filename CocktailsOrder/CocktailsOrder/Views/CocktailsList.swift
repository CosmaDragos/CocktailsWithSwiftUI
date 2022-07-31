//
//  CocktailsList.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 30.07.2022.
//

import SwiftUI

struct CocktailsList: View {
    @EnvironmentObject var modelData: CocktailModelData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.cocktails) { cocktail in
                    NavigationLink {
                        //                        LandmarkDetails(landmark: landmark)
                    } label: {
                        CocktailCard(cocktail: cocktail)
                    }
                }
            }
            .navigationTitle("Cocktails")
        }
        .onAppear(perform: modelData.fetchCocktails)
    }
}
