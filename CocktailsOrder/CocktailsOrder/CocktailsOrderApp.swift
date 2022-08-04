//
//  CocktailsOrderApp.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 19.07.2022.
//

import SwiftUI

@main
struct CocktailsOrderApp: App {
    @StateObject private var modelData = CocktailModelData()
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .environmentObject(modelData)
        }
    }
}
