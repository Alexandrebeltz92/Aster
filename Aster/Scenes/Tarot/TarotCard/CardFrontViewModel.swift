//
//  CardFrontViewModel.swift
//  Aster
//
//  Created by Alexandre Graverol on 13/09/2022.
//

import Foundation
import AsterCore

class CardFrontViewModel: ObservableObject {
    @Published var tarotCard = "10_The_Fates"

    let deck = ["0_The_Fool", "1_The_Magicien", "10_The_Fates"]

    func getRandomCard() -> String {
        tarotCard = deck.randomElement() ?? "10_The_Fates"

        return tarotCard
    }
}
