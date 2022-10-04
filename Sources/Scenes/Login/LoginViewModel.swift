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
    var pseudo = ""
    var birthday: Date = Date()

    let store = UserStore.instance

     // MARK: - Functions

    func save() {
        let month = Calendar.current.component(.month, from: birthday)
        let day = Calendar.current.component(.day, from: birthday)

        guard let sign = AstrologicalSigns.sign(for: month, day: day) else {
            fatalError("Should not happen")
        }

        let userToPersist = User(pseudo: pseudo,
                                 astrologicalSign: sign.rawValue,
                                 cards: [])

        store.persist(user: userToPersist)
    }
}
