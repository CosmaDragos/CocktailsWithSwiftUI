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
            CocktailsList()
                .tabItem {
                    Label("MyBar", systemImage: "list.dash")
                }
            
            CocktailsList()
                .tabItem {
                    Label("Discover", systemImage: "square.and.pencil")
                }
        }
    }
}
