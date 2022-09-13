//
//  TarotCardDetailViewModel.swift
//  Aster
//
//  Created by Alexandre Graverol on 06/09/2022.
//

import Foundation
import AsterCore

class TarotCardDetailViewModel: ObservableObject {

    // MARK: - Properties
    var card: Card
    var descriptions = [""]
    @Published var name = "The Fool"
    @Published var description = "The Water flows in you"

    // MARK: - Initialization
    init(card: Card) {
        self.card = card
    }

    func getInformation() {
        name = card.name
    }
}
