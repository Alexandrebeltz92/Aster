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
        let birthday = dayOfBirth + monthOfBirth
        let sign = getSign()

        let userToPersist = User(pseudo: pseudo, dateOfBirth: birthday, astrologicalSign: sign, cards: [])

        store.persist(user: userToPersist)
    }

    func getSign() -> String {
        let birthday = dayOfBirth + monthOfBirth

        if (10...100).contains(50) {
            print("Number is inside the range")
        }

        return "aries"
    }
}
