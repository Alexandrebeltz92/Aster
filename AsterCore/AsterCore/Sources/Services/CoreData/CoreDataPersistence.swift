//
//  CoreDataPersistence.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation
import CoreData

public class CoreDataPersistence: UserService {

    // MARK: - Properties
    private var users: [User] = []
    private let coreDataStack: CoreDataStack

    // MARK: - Init
    init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
        self.coreDataStack = coreDataStack
    }

    // MARK: - Functions
    public func getUsers() -> [User] {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        do {
            return try coreDataStack.viewContext.fetch(request).map { $0.toUser() }
        } catch {
            print("Oups something went wrong")
            return []
        }
    }

    public func persist(user: User) {
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

    public func delete(user: User) {
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

    func update(user: User) {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        request.predicate = NSPredicate(format: "pseudo == %@", user.pseudo)

        do {
            guard let userToUpdate = try coreDataStack.viewContext.fetch(request).first else {
                return
            }

                // TODO: How to add new card here
//            userToUpdate.cards += card

            try coreDataStack.viewContext.save()
        } catch {
                print("Sorry a problem occured")
            }
    }

    func deleteAllUsers() {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()

        do {
            let usersToDelete = try coreDataStack.viewContext.fetch(request)

            usersToDelete.forEach {  coreDataStack.viewContext.delete($0) }

            try coreDataStack.viewContext.save()

            users.removeAll()
        } catch {
            print("Something went wrong")
        }
    }
}
