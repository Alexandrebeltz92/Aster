//
//  CoreDataPersistence.swift
//  Aster
//
//  Created by Alexandre Graverol on 30/08/2022.
//

import Foundation
import CoreData

class CoreDataPersistence: UserService {

    // MARK: - Properties
    private var users: [User] = []
    private let coreDataStack: CoreDataStack

    // MARK: - Init
    init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
        self.coreDataStack = coreDataStack
    }

    // MARK: - Functions
    func getUsers() -> [User] {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        do {
            return try coreDataStack.viewContext.fetch(request).map { $0.toUser() }
        } catch {
            print("Oups something went wrong")
            return []
        }
    }

    func persist(user: User) {
        guard !users.contains(user) else {
            return
        }

        _ = user.toEntity(context: coreDataStack.viewContext)

        do {
            try coreDataStack.viewContext.save()

            users.append(user)
        } catch {
            print("We were unable to save \(user.pseudo)")
        }
    }

    func delete(user: User) {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        request.predicate = NSPredicate(format: "pseudo == %@", user.pseudo)

        do {
            guard let userToDelete = try coreDataStack.viewContext.fetch(request).first else {
                return
            }

            coreDataStack.viewContext.delete(userToDelete)
            try coreDataStack.viewContext.save()
            users.removeAll(where: { $0 == user })
        } catch {
            print("Sorry a problem occured")
        }
    }
}
