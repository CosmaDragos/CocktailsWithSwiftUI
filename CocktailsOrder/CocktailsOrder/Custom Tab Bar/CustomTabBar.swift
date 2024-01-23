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
        // TODO: check why the cornerRadius is not working anymore
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .background(Color.lightGray
            .shadow(color: Color.black, radius: 10, x: 0, y: 0)
            .mask(Rectangle().padding(.top, -20))
        )
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
