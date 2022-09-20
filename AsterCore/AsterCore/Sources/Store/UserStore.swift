//
//  UserStore.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation

public protocol UserStoreDelegate: AnyObject {
    func didUpdate(users: [User])
}

final public class UserStore {

    static public let instance = UserStore()

    public var users: [User] = []
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

    public func getPersistedUsers() {
        users = services.flatMap { $0.getUsers() }
    }

    public func persist(user: User) {
        services.forEach { $0.persist(user: user) }
    }

    public func delete(user: User) {
        services.forEach { $0.delete(user: user) }
    }

    public func update(user: User) {
        services.forEach { $0.update(user: user) }
    }
}
