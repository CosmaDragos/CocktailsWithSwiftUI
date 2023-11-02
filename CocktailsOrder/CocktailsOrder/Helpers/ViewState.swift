//
//  ViewState.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 14.03.2023.
//

import SwiftUI

protocol LoadableObject: ObservableObject {
    var state: ViewState { get }
}

enum ViewState {
    case empty
    case loading(hasOpacity: Bool)
    case loaded
    case failed(APIError)
    case alert(title: LocalizedStringKey?, message: LocalizedStringKey)
}
