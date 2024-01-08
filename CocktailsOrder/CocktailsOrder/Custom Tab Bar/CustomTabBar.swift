//
//  CustomTabBar.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 07.01.2024.
//

import SwiftUI

enum Tabs: Int {
    case myBar = 0
    case discover = 1
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        
        HStack {
            Button {
                selectedTab = .myBar
            } label: {
                TabBarButton(buttonText: "MyBar", imageName: "list.dash", isActive: selectedTab == .myBar)
            }
            .tint(Color.gray)
            Button {
                selectedTab = .discover
            } label: {
                TabBarButton(buttonText: "Discover", imageName: "square.and.pencil", isActive: selectedTab == .discover)
            }
            .tint(Color.gray)
        }
        .frame(height: 82)
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.discover))
}
