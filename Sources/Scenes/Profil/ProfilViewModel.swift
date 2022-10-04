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
    @Published
    var userToDisplay: User
    var savedCardsText = "Last cards saved:"

    let userStore = UserStore.instance
    let cardStore = CardStore.instance

    // MARK: - Initialization
    init() {
        self.userToDisplay = Self.getUser()
    }

    private static func getUser() -> User {
        UserStore.instance.getPersistedUsers()

        guard let user = UserStore.instance.users.first else {
            fatalError("Should not happen")
        }

        CardStore.instance.getPersistedCards(for: user)
        user.cards = CardStore.instance.cards

        return user
    }

    func refreshUser() {
        userStore.getPersistedUsers()

        guard let user = userStore.users.first else {
            return
        }

        cardStore.getPersistedCards(for: user)
        user.cards = cardStore.cards

        userToDisplay = user
    }
}
