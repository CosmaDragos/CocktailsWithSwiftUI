//
//  ViewStateModifier.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 14.03.2023.
//

import SwiftUI

extension View {
    func viewState(_ state: ViewState) -> some View {
        modifier(ViewStateModifier(state: state))
    }
}

// MARK: - Helper

private struct ViewStateModifier: ViewModifier {
    let state: ViewState

    func body(content: Content) -> some View {
        switch state {
        case .loaded:
            content
        case .loading(let hasOpacity):
            content
                .overlay {
                    ZStack {
                        Color(white: 0, opacity: hasOpacity ? 0.75 : 0)
                        ProgressView()
                            .tint(hasOpacity ? .white : .gray)
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                .disabled(true)
        case .empty:
            Text("No data to display")
        case .failed(let error):
            Text(error.errorDescription ?? "")
        case .alert(let title, let message):
            content
                .alert(title ?? "", isPresented: .constant(true), actions: {
                    Button("OK", role: .cancel) { }
                }, message: {
                    Text(message)
                })
        }
    }
}
