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
    var savedCardsText = "Last cards saved:"

    let userStore = UserStore.instance

    // MARK: - Initialization
    init() {
        self.userToDisplay = Self.getUser()
    }

    private static func getUser() -> User {
        UserStore.instance.getPersistedUsers()

        guard let user = UserStore.instance.users.first else {
            fatalError("Should not happen")
        }

        return user
    }

    func refreshUser() {
        userStore.getPersistedUsers()

        guard let user = userStore.users.first else {
            return
        }

        userToDisplay = user
    }
}
