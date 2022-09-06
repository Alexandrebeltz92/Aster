//
//  LoginViewModel.swift
//  Aster
//
//  Created by Alexandre Graverol on 30/08/2022.
//

import Foundation

extension LoginView {

    class LoginViewModel: ObservableObject {

        // MARK: - Properties
        @Published var catchPhrase = "The Stars greets you!"
        @Published var pseudo = "Pseudo"
        @Published var dateOfBirth = "Birthday: Day/Month"

        // MARK: - Functions
    }
}
