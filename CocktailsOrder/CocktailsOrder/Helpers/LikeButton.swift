//
//  LikeButton.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 02.08.2022.
//

import SwiftUI

struct LikeButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundColor(.black)
        }
    }
}
