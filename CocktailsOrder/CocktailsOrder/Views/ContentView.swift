//
//  ContentView.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 19.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       CocktailsList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CocktailModelData())
    }
}
