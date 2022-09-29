//
//  CoreDataPersistenceCard.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 29/09/2022.
//

import Foundation
import CoreData

public class CoreDataPersistenceCard: CardService {

    // MARK: - Properties
    private var cards: [Card] = []
    private let coreDataStack: CoreDataStack

    // MARK: - Init
    init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
        self.coreDataStack = coreDataStack
    }

    // MARK: - Functions
    public func getCards(for user: User) -> [Card] {
        let request: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
        do {
            return try coreDataStack.viewContext.fetch(request).map { $0.toCard() }
        } catch {
            print("Oups something went wrong")
            return []
        }
    }

    public func persist(card: Card, user: User) {
        guard !cards.contains(card) else {
            return
        }

        _ = card.toEntity(context: coreDataStack.viewContext)

        do {
            try coreDataStack.viewContext.save()

            cards.append(card)
            user.cards = cards
        } catch {
            print("We were unable to save \(card.name)")
        }
    }

    public func delete(card: Card, user: User) {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        request.predicate = NSPredicate(format: "pseudo == %@", user.pseudo)

        let requestCard: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
        requestCard.predicate = NSPredicate(format: "name == %@", card.name)

        do { guard let cardToDelete = try coreDataStack.viewContext.fetch(requestCard).first else {
                return
            }

            coreDataStack.viewContext.delete(cardToDelete)
            try coreDataStack.viewContext.save()
            user.cards.removeAll(where: { $0 == card })
            cards.removeAll(where: { $0 == card })
        } catch {
            print("Sorry a problem occured")
        }
    }

    func update(card: Card, for user: User) {
        let request: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", card.name)

        do {
            guard let firstCard = user.cards.first?.toEntity(context: coreDataStack.viewContext) else {
                return
            }

            let userToSave = user.toEntity(context: coreDataStack.viewContext)
            userToSave.addToCards(NSSet(array: [firstCard]))

            try coreDataStack.viewContext.save()
        } catch {
                print("Sorry a problem occured")
            }
    }

    func deleteAllCardsAndUsers() {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        let requestCard: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()

        do {
            let usersToDelete = try coreDataStack.viewContext.fetch(request)
            let cardsToDelete = try coreDataStack.viewContext.fetch(requestCard)

            usersToDelete.forEach {  coreDataStack.viewContext.delete($0) }
            cardsToDelete.forEach { coreDataStack.viewContext.delete($0)}

            try coreDataStack.viewContext.save()

            cards.removeAll()
        } catch {
            print("Something went wrong")
        }
    }
}
