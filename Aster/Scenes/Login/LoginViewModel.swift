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

    let store = UserStore.instance

     // MARK: - Functions

    func save() {
        guard let month = Int(monthOfBirth), let day = Int(dayOfBirth) else {
            print("something went wrong")
            return
        }

        let sign = AstrologicalSigns.sign(for: month, day: day)

        let userToPersist = User(pseudo: pseudo,
                                 astrologicalSign: sign.rawValue,
                                 cards: [])

        store.persist(user: userToPersist)
    }
}
