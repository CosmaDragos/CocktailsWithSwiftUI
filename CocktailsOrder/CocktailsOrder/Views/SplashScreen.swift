//
//  SplashScreen.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 04.08.2022.
//

import Foundation
import SwiftUI

struct SplashScreen: View {
    @State var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Image("cocktail_logo")
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    isActive = true
                }
            }
        }
    }
}
