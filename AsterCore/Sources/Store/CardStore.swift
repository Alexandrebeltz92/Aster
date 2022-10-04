//
//  CardStore.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 29/09/2022.
//

import Foundation

public protocol CardStoreDelegate: AnyObject {
    func didUpdate(cards: [Card])
}

final public class CardStore {

    static public let instance = CardStore()

    public var cards: [Card] = []
    weak var delegate: CardStoreDelegate?

    private var services: [CardService] {
        didSet {
            delegate?.didUpdate(cards: cards)
        }
    }

    private init() {
        services = [
            CoreDataPersistenceCard()
        ]
    }

    public func getPersistedCards(for user: User) {
        cards = services.flatMap { $0.getCards(for: user) }
    }

    public func persist(card: Card, user: User) {
        services.forEach { $0.persist(card: card, user: user) }
    }

    public func delete(card: Card, user: User) {
        services.forEach { $0.delete(card: card, user: user) }
    }

//    public func update(user: User) {
//        services.forEach { $0.update(user: user) }
//    }

    public func deleteAllCardsAndUsers() {
        services.forEach { $0.deleteAllCardsAndUsers() }
    }
}
