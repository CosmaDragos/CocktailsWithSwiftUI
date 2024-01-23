//
//  ContentView.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 19.07.2022.
//

import SwiftUI

struct ContentView: View {   
    
    @State var selectedTab: Tabs = .myBar
    
    var body: some View {
        VStack {
            Spacer()
            switch selectedTab {
            case .myBar:
                MyListView()
            case .discover:
                CocktailsList()
            }
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}
