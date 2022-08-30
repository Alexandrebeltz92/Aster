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

        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        do {
            return try coreDataStack.viewContext.fetch(request).map { $0.toRecipe() }
        } catch {
            print("Oups something went wrong")
            return []
        }
    }

    func persist(card: Card) {
        guard !recipes.contains(recipe) else {
            return
        }

        _ = recipe.toEntity(context: coreDataStack.viewContext)

        do {
            try coreDataStack.viewContext.save()

            recipes.append(recipe)
        } catch {
            print("We were unable to save \(recipe.label)")
        }
    }

    func delete(card: Card) {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        request.predicate = NSPredicate(format: "label == %@", recipe.label)

        do {
            guard let recipeToDelete = try coreDataStack.viewContext.fetch(request).first else {
                return
            }

            coreDataStack.viewContext.delete(recipeToDelete)
            try coreDataStack.viewContext.save()
            recipes.removeAll(where: { $0 == recipe })
        } catch {
            print("Sorry a problem occured")
        }
    }
}
