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
    var pseudo = "Username"
    var dayOfBirth = "Birthday"
    var monthOfBirth = "Birthmonth"

    let store = UserStore.instance

     // MARK: - Functions

    func save() {
        let month = Int(monthOfBirth)
        let day = Int(dayOfBirth)

        guard let newMonth = month, let newDay = day else {
            print("something went wrong")
            return
        }

        let sign = AstrologicalSigns.sign(for: newMonth, day: newDay)

        let userToPersist = User(pseudo: pseudo,
                                 astrologicalSign: sign.rawValue,
                                 cards: [])

        store.persist(user: userToPersist)
    }
}
