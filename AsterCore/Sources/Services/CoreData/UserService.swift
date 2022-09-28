//
//  UserService.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation

protocol UserService {
    func getUsers() -> [User]

    func persist(user: User)

    func delete(user: User)

    func update(user: User)

    func deleteAllUsers()
}
