//
//  ProfilModelView.swift
//  Aster
//
//  Created by Alexandre Graverol on 31/08/2022.
//

import Foundation

// MARK: - LoginView
extension ProfilView {

    // MARK: - Class LoginModelView
    class ProfilModelView: ObservableObject {

        // MARK: - Properties
        @Published var pseudo = "Mozart"
        @Published var sign = "Aries"
        @Published var signImage = "Aries"
        @Published var savedCardsText = "Saved cards:"
        @Published var cards: [Card] = [Card(name: "0_The_Fool"), Card(name: "1_The_Magicien") , Card(name: "2_The_High_Priestess"), Card(name: "3_The_Empress"), Card(name:"4_The_Emperor"), Card(name: "5_The_Hierophant")]

        // MARK: - Functions
    }
}
