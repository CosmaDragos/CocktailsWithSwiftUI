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
    @State private var myBarButtonColor: Color = .blue
    @State private var discoverButtonColor: Color = .white
    
    var body: some View {
        HStack {
            
            Button {
                selectedTab = .myBar
                self.choseColor()
            } label: {
                TabBarButton(buttonText: "MyBar", imageName: "list.dash", isActive: selectedTab == .myBar)
            }
            .tint(myBarButtonColor)
            
            Button {
                selectedTab = .discover
                self.choseColor()
            } label: {
                TabBarButton(buttonText: "Discover", imageName: "square.and.pencil", isActive: selectedTab == .discover)
            }
            .tint(discoverButtonColor)
        }
        .frame(height: 82)
        .background(Color.lightGray)
                      .cornerRadius(20)
                      .padding(.top, 32)
                      .shadow(color: Color.blue, radius: 20)
                      .clipShape(TopRoundedCornersShape(radius: 20))
                      .mask(Rectangle().padding(.top, -20))
    }
    
    private func choseColor() {
        switch selectedTab {
        case .myBar:
            myBarButtonColor = .blue
            discoverButtonColor = .white
        case .discover:
            myBarButtonColor = .white
            discoverButtonColor = .blue
        }
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.discover))
}
