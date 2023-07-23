//
//  LikeButton.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 02.08.2022.
//

import SwiftUI

struct LikeButton: View {
    var isLiked: Bool
    
    var body: some View {
        Image(systemName: isLiked ? "heart.fill" : "heart")
            .labelStyle(.iconOnly)
            .foregroundColor(.black)
    }
}
