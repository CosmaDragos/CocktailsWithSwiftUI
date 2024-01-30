//
//  TabBarButton.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 08.01.2024.
//

import SwiftUI

struct TabBarButton: View {
    
    var buttonText: String
    var imageName: String
    var isActive: Bool
    
    var body: some View {
        GeometryReader { geo in
            if isActive {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: geo.size.width / 2, height: 4)
                    .padding(.leading, geo.size.width / 4)
            }
        
            VStack (alignment: .center, spacing: 4) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                
                Text(buttonText)
                    .font(.system(size: 10))
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

//#Preview {
//    TabBarButton(buttonText: "MyBar", imageName: "list.dash", isActive: true)
//}
