//
//  UserService.swift
//  Aster
//
//  Created by Alexandre Graverol on 30/08/2022.
//

import Foundation

protocol UserService {
    func getUsers() -> [User]

    func persist(user: User)

    func delete(user: User)
}
