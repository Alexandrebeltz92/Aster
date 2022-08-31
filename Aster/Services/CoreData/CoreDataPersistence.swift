//
//  CoreDataPersistence.swift
//  Aster
//
//  Created by Alexandre Graverol on 30/08/2022.
//

import Foundation
import CoreData

class CoreDataPersistence: CoreDataService {

    // MARK: - Properties

    private var cards: [Card] = []
    private let coreDataStack: CoreDataStack

    // MARK: - Init

    init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
        self.coreDataStack = coreDataStack
    }

    // MARK: - Functions

    func getCards() -> [Card] {

        let request: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
        do {
            return try coreDataStack.viewContext.fetch(request).map { $0.toCard() }
        } catch {
            print("Oups something went wrong")
            return []
        }
    }

    func persist(card: Card) {
//        guard !cards.contains() else {
//            return
//        }

        _ = card.toEntity(context: coreDataStack.viewContext)

        do {
            try coreDataStack.viewContext.save()

            cards.append(card)
        } catch {
            print("We were unable to save \(card.name)")
        }
    }

    func delete(card: Card) {
        let request: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", card.name)

        do {
            guard let cardToDelete = try coreDataStack.viewContext.fetch(request).first else {
                return
            }

            coreDataStack.viewContext.delete(cardToDelete)
            try coreDataStack.viewContext.save()
            cards.removeAll(where: { $0 == card })
        } catch {
            print("Sorry a problem occured")
        }
    }
}
