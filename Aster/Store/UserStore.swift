//
//  UserStore.swift
//  Aster
//
//  Created by Alexandre Graverol on 31/08/2022.
//

import Foundation

protocol UserStoreDelegate: AnyObject {
    func didUpdate(users: [User])
}

final class UserStore {

    static let instance = UserStore()

    var users: [User] = []
    weak var delegate: UserStoreDelegate?

    private var services: [UserService] {
        didSet {
            delegate?.didUpdate(users: users)
        }
    }

    private init() {
        services = [
            CoreDataPersistence()
        ]
    }

    func getPersistedUsers() {
        users = services.flatMap { $0.getUsers() }
    }

    func persist(user: User) {
        services.forEach { $0.persist(user: user) }
    }

    func delete(user: User) {
        services.forEach { $0.delete(user: user) }
    }
}
