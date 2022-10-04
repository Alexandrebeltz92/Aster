//
//  CardService.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 29/09/2022.
//

import Foundation

protocol CardService {
    func getCards(for user: User) -> [Card]

    func persist(card: Card, user: User)

    func delete(card: Card, user: User)

    func update(card: Card, for user: User)

    func deleteAllCardsAndUsers()
}
