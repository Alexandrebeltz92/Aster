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

        let currentCard = card

        currentUser.cards.append(currentCard)
        userStore.update(user: currentUser)
    }

    func checkIfSaved(for card: Card) -> Bool {
        userStore.getPersistedUsers()

        guard let user = userStore.users.first else {
            fatalError()
        }

        if user.cards.contains(where: { $0 == card }) {
            return true
        } else {
            return false
        }
    }
}
