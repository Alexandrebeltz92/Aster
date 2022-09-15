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
    @Published var pseudo = "Mozart"
    @Published var sign = "Aries"
    @Published var signImage = "Aries"
    @Published var savedCardsText = "Saved cards:"
    @Published var cards: [Card] = []

    let store = UserStore.instance

    func display(user: User) {
        store.getPersistedUsers()

        pseudo = user.pseudo
        sign = user.astrologicalSign
        signImage = user.astrologicalSign
        cards = user.cards
    }
}
