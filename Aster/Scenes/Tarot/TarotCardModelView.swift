//
//  TarotCardModelView.swift
//  Aster
//
//  Created by Alexandre Graverol on 19/08/2022.
//

import Foundation

extension TarotCardView {
    class TarotCardModelView: ObservableObject {

    }
}

extension CardFront  {
    class CardFrontModelView: ObservableObject {
        @Published var tarotCard = "0 The Fool"

        let firstDeck = ["0 The Fool", "1 The Magician", "2 The High Priestess", "3 The Empress", "5 The Hierophant", "7 The Chariot", "9 The Hermit", "19 The Sun", "21 The World"]
        
        let secondDeck = ["0_The_Fool", "1_The_Magicien", "2_The_High_Priestess", "3_The_Empress", "4_The_Emperor", "5_The_Hierophant", "6_The_Lovers", "7_The_Chariot", "8_The_Justice", "9_The_Hermit", "10_The_Fates", "11_The_Strenght", "12_The_Hanged_Man", "13_The_Death", "14_The_Temperance", "15_The_Devil", "16_The_Lightning", "17_The_Star", "18_The_Moon", "19_The_Sun", "20_The_Judgement", "21_The_World"]

        func getRandomCard() {
            tarotCard = secondDeck.randomElement() ?? "0_The_Fool"
        }
    }
}
