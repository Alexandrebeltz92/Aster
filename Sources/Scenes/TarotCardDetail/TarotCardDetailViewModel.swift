//
//  TarotCardDetailViewModel.swift
//  Aster
//
//  Created by Alexandre Graverol on 06/09/2022.
//

import Foundation
import AsterCore

class TarotCardDetailViewModel: ObservableObject {

    // MARK: - Properties
    let userStore = UserStore.instance
    let cardStore = CardStore.instance

    var card: Card

    // MARK: - Initialization
    init(card: Card) {
        self.card = card
    }

    func saveCard() {
        userStore.getPersistedUsers()

        guard let currentUser = userStore.users.first else {
            print("Something went wrong")
            return
        }

        cardStore.getPersistedCards(for: currentUser)

        currentUser.cards.append(card)
        cardStore.persist(card: card, user: currentUser)
    }

    func checkIfSaved(for card: Card) -> Bool {
        userStore.getPersistedUsers()

        guard let user = userStore.users.first else {
            fatalError()
        }

        cardStore.getPersistedCards(for: user)

        let cards = cardStore.cards

        if user.cards.contains(where: { $0 == card }), cards.contains(where: { $0.name == card.name }) {
            return true
        } else {
            return false
        }
    }
}
