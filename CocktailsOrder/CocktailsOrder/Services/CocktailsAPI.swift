//
//  CocktailsAPI.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 14.03.2023.
//

extension CocktailsService {
    /// An enumeration of all cocktails endpoints.
    enum API {
        case cocktails
    }
}

extension CocktailsService.API: APICall {
    var path: String {
        switch self {
        case .cocktails:
            return "/api/json/v1/1/filter.php?a=Alcoholic"
        }
    }
}
