//
//  LoginViewModel.swift
//  Aster
//
//  Created by Alexandre Graverol on 30/08/2022.
//

import Foundation
import AsterCore

class LoginViewModel: ObservableObject {

    // MARK: - Properties

    var catchPhrase = "The Stars greets you!"
    var pseudo = "Pseudo"
    var dayOfBirth = "Birthday"
    var monthOfBirth = "Birth Month"

//    let service: CoreDataPersistence
    let store = UserStore.instance

    // MARK: - Initialization
//    init(service: CoreDataPersistence) {
//        self.service = service
//    }

     // MARK: - Functions

    func save(user: User) {
        let birthday = dayOfBirth + monthOfBirth
        let userToPersist = User(pseudo: pseudo, dateOfBirth: birthday, astrologicalSign: "aries", cards: [])

        store.persist(user: userToPersist)
//        service.persist(user: user)
    }
}
