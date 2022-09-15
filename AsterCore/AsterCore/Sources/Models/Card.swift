//
//  Card.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation
import SwiftUI

public class Card {
    public let name: String
    public let description: String

    public init(name: String, description: String) {
        self.name = name
        self.description = description
    }

    public let deck = [
        Card(name: "0_The_Fool", description: "You are on the verge of an exciting, unexpected new adventure. Your new adventure will bring you along a path which may require you to make a leap of faith but you will grow as a result of this new experience."),
        Card(name: "1_The_Magicien", description: "The universe is aligning to bring positive changes your way, you have the power to             manifest the outcome you want."),
        Card(name: "2_The_High_Priestess", description: "Now is the time to trust your instincts and go with your gut feeling. Pay attention to your dreams and the signs and symbols the universe is sending you."),
        Card(name: "3_The_Empress", description: "You should embrace your softer side, allow yourself to explore the emotions you are feeling and listen to your intuition."),
        Card(name: "4_The_Emperor", description: "Concentration, structure, stability and focus is required if you want to make your ideas and dreams a reality."),
        Card(name: "5_The_Hierophant", description: "Now is a time to conform to convention or tradition. It’s not a time to rock the boat."),
        Card(name: "6_The_Lovers", description: "Don’t go for the easy road, make sure you have all the information and make the right decision. Even if it seems like a difficult path, it will lead you on to greater things."),
        Card(name: "7_The_Chariot", description: "There may be many obstacles in your path but if you stay focused, keep your composure and are confident in your abilities, you will be successful."),
        Card(name: "8_The_Justice", description: "You have all the skills you need to be successful, the focus now is to conquer your inner worries and believe in yourself."),
        Card(name: "9_The_Hermit", description: "Maybe now the time to isolating yourself or withdrawing into yourself in order to recover from a difficult situation. This is a time to focus on yourself and meeting your own needs."),
        Card(name: "10_The_Fates", description: "Know that the universe has a plan for you even if that plan is not clear to you at this point. We must learn to accept this process as part of living, even if it’s uncomfortable at times."),
        Card(name: "11_The_Strenght", description: "All actions have consequences. So look at your present circumstances in that context, how have your own actions contributed to where you find yourself today?"),
        Card(name: "12_The_Hanged_Man", description: "You may be feeling like you are stuck in a rut or trapped in a situation or frame of mind that is not making you happy but you have the power to release yourself"),
        Card(name: "13_The_Death", description: "The transformation or change that Death can bring can be difficult, unexpected, sudden or     even traumatic but it will bring with it a new lease of life."),
        Card(name: "14_The_Temperance", description: "You have learned not to allow yourself to be dragged into other people’s conflict or to let minor issues knock you off balance. Instead you adapt to the situations with a clear mind and calm heart and keep your balance"),
        Card(name: "15_The_Devil", description: "You may feel as though outside influences or forces beyond your control are restricting you, leaving you feeling powerless. Don’t give up and don’t give away your power."),
        Card(name: "16_The_Lightning", description: "A sudden upheaval and unexpected change will come. This change usually is scary, life changing and often unavoidable. It will be a scary adjustment and will change your life as you know it."),
        Card(name: "17_The_Star", description: "You have come through your tough times with a renewed sense of yourself and the world around you, you are full of calm, well-balanced energy and you are open to healing the wounds of the past"),
        Card(name: "18_The_Moon", description: "The Moons tells you that something about a situation or person in your life is not what it appears to be and you need to trust what your instincts are telling you in order to see past this illusion"),
        Card(name: "19_The_Sun", description: "You will find that people are drawn to the happy vibes and positive energy you are giving out and you will bring light and joy to everyone and everything you come into contact with."),
        Card(name: "20_The_Judgement", description: "You have achieved a level of clarity and composure that allows you to calmly evaluate yourself and your choices in order to make positive decisions."),
        Card(name: "21_The_World", description: "The universe is smiling upon you and luck is on your side.")
    ]
}

extension Card: Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    static public func == (lhs: Card, rhs: Card) -> Bool {
        (lhs.name) == (rhs.name)
    }
}

// TODO: observableObject.
@MainActor public class Cards: ObservableObject {
    @Published var cards: [Card]

    init() {
        cards = [
            Card(name: "0_The_Fool", description: "You are on the verge of an exciting, unexpected new adventure. Your new adventure will bring you along a path which may require you to make a leap of faith but you will grow as a result of this new experience."),
            Card(name: "1_The_Magicien", description: "The universe is aligning to bring positive changes your way, you have the power to             manifest the outcome you want."),
            Card(name: "2_The_High_Priestess", description: "Now is the time to trust your instincts and go with your gut feeling. Pay attention to your dreams and the signs and symbols the universe is sending you."),
            Card(name: "3_The_Empress", description: "You should embrace your softer side, allow yourself to explore the emotions you are feeling and listen to your intuition."),
            Card(name: "4_The_Emperor", description: "Concentration, structure, stability and focus is required if you want to make your ideas and dreams a reality."),
            Card(name: "5_The_Hierophant", description: "Now is a time to conform to convention or tradition. It’s not a time to rock the boat."),
            Card(name: "6_The_Lovers", description: "Don’t go for the easy road, make sure you have all the information and make the right decision. Even if it seems like a difficult path, it will lead you on to greater things."),
            Card(name: "7_The_Chariot", description: "There may be many obstacles in your path but if you stay focused, keep your composure and are confident in your abilities, you will be successful."),
            Card(name: "8_The_Justice", description: "You have all the skills you need to be successful, the focus now is to conquer your inner worries and believe in yourself."),
            Card(name: "9_The_Hermit", description: "Maybe now the time to isolating yourself or withdrawing into yourself in order to recover from a difficult situation. This is a time to focus on yourself and meeting your own needs."),
            Card(name: "10_The_Fates", description: "Know that the universe has a plan for you even if that plan is not clear to you at this point. We must learn to accept this process as part of living, even if it’s uncomfortable at times."),
            Card(name: "11_The_Strenght", description: "All actions have consequences. So look at your present circumstances in that context, how have your own actions contributed to where you find yourself today?"),
            Card(name: "12_The_Hanged_Man", description: "You may be feeling like you are stuck in a rut or trapped in a situation or frame of mind that is not making you happy but you have the power to release yourself"),
            Card(name: "13_The_Death", description: "The transformation or change that Death can bring can be difficult, unexpected, sudden or     even traumatic but it will bring with it a new lease of life."),
            Card(name: "14_The_Temperance", description: "You have learned not to allow yourself to be dragged into other people’s conflict or to let minor issues knock you off balance. Instead you adapt to the situations with a clear mind and calm heart and keep your balance"),
            Card(name: "15_The_Devil", description: "You may feel as though outside influences or forces beyond your control are restricting you, leaving you feeling powerless. Don’t give up and don’t give away your power."),
            Card(name: "16_The_Lightning", description: "A sudden upheaval and unexpected change will come. This change usually is scary, life changing and often unavoidable. It will be a scary adjustment and will change your life as you know it."),
            Card(name: "17_The_Star", description: "You have come through your tough times with a renewed sense of yourself and the world around you, you are full of calm, well-balanced energy and you are open to healing the wounds of the past"),
            Card(name: "18_The_Moon", description: "The Moons tells you that something about a situation or person in your life is not what it appears to be and you need to trust what your instincts are telling you in order to see past this illusion"),
            Card(name: "19_The_Sun", description: "You will find that people are drawn to the happy vibes and positive energy you are giving out and you will bring light and joy to everyone and everything you come into contact with."),
            Card(name: "20_The_Judgement", description: "You have achieved a level of clarity and composure that allows you to calmly evaluate yourself and your choices in order to make positive decisions."),
            Card(name: "21_The_World", description: "The universe is smiling upon you and luck is on your side.")
        ]
    }
}
