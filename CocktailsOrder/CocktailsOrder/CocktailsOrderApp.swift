//
//  CocktailsOrderApp.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 19.07.2022.
//

import SwiftUI

@main
struct CocktailsOrderApp: App {
    @StateObject var cocktailVM = CocktailViewModel(cocktailsService: CocktailsService(baseURL: "https://www.thecocktaildb.com/api"))

    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .environmentObject(cocktailVM)
        }
    }
}

