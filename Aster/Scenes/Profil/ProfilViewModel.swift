//
//  ProfilViewModel.swift
//  Aster
//
//  Created by Alexandre Graverol on 31/08/2022.
//

import Foundation
import AsterCore

// MARK: - Class LoginModelView
class ProfilViewModel: ObservableObject {

    // MARK: - Properties
    var userToDisplay: User
    var savedCardsText = "Your cards saved:"

    let store = UserStore.instance

    // MARK: - Initialization
    init() {
        self.userToDisplay = Self.getUser()
    }

    private static func getUser() -> User {
        UserStore.instance.getPersistedUsers()

        guard let user = UserStore.instance.users.first else {
            return User(pseudo: "Sorry something went wrong", astrologicalSign: "", cards: [])
        }

        return user
    }

    func refreshUser() {
        store.getPersistedUsers()

        guard let user = store.users.first else {
            return
        }

        userToDisplay = user
    }
}
