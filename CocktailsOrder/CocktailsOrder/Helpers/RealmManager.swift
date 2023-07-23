//
//  RealmManager.swift
//  CocktailsOrder
//
//  Created by Cosma Dragos on 23.07.2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var cocktails: [CocktailObject] = []
    
    init() {
        openRealm()
//        resetRealm()
        getCocktails()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    func addCocktail(cocktail: CocktailObject) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newCocktail = CocktailObject(value: ["strId": cocktail.strId ?? "", "strDrink": cocktail.strDrink ?? "",
                                                             "strDrinkThumb": cocktail.strDrinkThumb ?? "", "isAddedToMyList": cocktail.isAddedToMyList])
                    localRealm.add(newCocktail)
                    getCocktails()
                    print("Added new cocktail to Realm: \(newCocktail)")
                }
            } catch {
                print("Error adding cocktail to Realm: \(error)")
            }
        }
    }
    
    func getCocktails() {
        if let localRealm = localRealm {
            let allCocktails = localRealm.objects(CocktailObject.self)
            cocktails = []
            allCocktails.forEach { cocktail in
                cocktails.append(cocktail)
            }
        }
    }
    
//    func resetRealm() {
//        do {
//            try localRealm?.write {
//                localRealm?.deleteAll()
//            }
//        } catch {
//            print("Error clearing Realm database: \(error)")
//        }
//    }
  
    func updateCocktail(id: ObjectId, isAddedToMyList: Bool) {
        if let localRealm = localRealm {
            do {
                let cocktailToUpdate = localRealm.objects(CocktailObject.self).filter(NSPredicate(format: "id == %@", id))
                guard !cocktailToUpdate.isEmpty else { return }
                
                try localRealm.write {
                    cocktailToUpdate[0].isAddedToMyList = isAddedToMyList
                    getCocktails()
                    print("Updated cocktail with id \(id)")
                }
                
            } catch {
                print("Error updating cocktail")
            }
        }
    }
}
