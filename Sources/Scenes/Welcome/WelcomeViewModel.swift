//
//  WelcomeViewModel.swift
//  Aster
//
//  Created by Alexandre Graverol on 14/09/2022.
//

import Foundation
import AsterCore

// MARK: - WelcomeViewModel
class WelcomeViewModel: ObservableObject {

    // MARK: - Properties
    var background = "background"
    var welcomeText = "Welcome to Aster!"
    var catchText = "Let the stars guide you..."
    var textButton = "Start now !"
    var textButtonUserSaved = "Look into the stars"

    let store = UserStore.instance

    func haveUserSaved() -> Bool {
        store.getPersistedUsers()

        if !store.users.isEmpty {
            return true
        } else {
            return false
        }
    }
}
