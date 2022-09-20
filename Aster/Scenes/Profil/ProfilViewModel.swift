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
    var pseudo = "Mozart"
    var sign = "Aries"
    var signImage = "Aries"
    var savedCardsText = "Saved cards:"
    var cards: [Card] = []

    let store = UserStore.instance

    func display(user: User) {
        store.getPersistedUsers()

        pseudo = user.pseudo
        sign = user.astrologicalSign
        signImage = user.astrologicalSign
        cards = user.cards
    }
}
