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

//        let service: UserService

        // MARK: - Initialization
//        init(service: UserService) {
//            self.service = service
//        }

        // MARK: - Functions
//
//        func save(user: User) {
//            service.persist(user: user)
//        }
    }
}
