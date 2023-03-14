//
//  ContentView.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 19.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MyListView()
                .tabItem {
                    Label("MyBar", systemImage: "list.dash")
                }
            
            if let baseURL = "https://www.thecocktaildb.com", let cocktailsStore = CocktailsStore(cocktailsService: CocktailsService(baseURL: baseURL)) {
                CocktailsList(store: cocktailsStore)
                    .tabItem {
                        Label("Discover", systemImage: "square.and.pencil")
                    }
            }
        }
    }
}
