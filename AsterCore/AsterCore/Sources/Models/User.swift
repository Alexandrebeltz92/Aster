//
//  User.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation

public class User {

    public let pseudo: String
    public let dateOfBirth: String
    public let astrologicalSign: String
    public let cards: [Card]

    public init(pseudo: String, dateOfBirth: String, astrologicalSign: String, cards: [Card]) {
        self.pseudo = pseudo
        self.dateOfBirth = dateOfBirth
        self.astrologicalSign = astrologicalSign
        self.cards = cards
    }

}

extension User: Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(pseudo)
        hasher.combine(dateOfBirth)
        hasher.combine(astrologicalSign)
    }

    static public func == (lhs: User, rhs: User) -> Bool {
        (lhs.pseudo, lhs.dateOfBirth,
         lhs.astrologicalSign, lhs.cards) == (rhs.pseudo, rhs.dateOfBirth, rhs.astrologicalSign, rhs.cards)
    }
}

//    func getAstroSign() -> String {
//
//        let sign: AstrologicalSigns
//        let birthday = dayOfBirth.replacingOccurrences(of: "/", with: "")
//        guard let newBirthday = Int(birthday) else {
//            return  pseudo
//        }
//
//        switch sign {
//        case .aries:
//            return "Aries"
//        case .taurus:
//            return "Taurus"
//        case .gemini:
//            return "Gemini"
//        case .cancer:
//            return "Cancer"
//        case .leo:
//            return "Leo"
//        case .virgo:
//            return "Virgo"
//        case .libra:
//            return "Libra"
//        case .scorpio:
//            return "Scorpio"
//        case .sagittarius:
//            return "Sagittarius"
//        case .capricorn:
//            return "Capricorn"
//        case .aquarius:
//            return "Aquarius"
//        case .pisces:
//            return "Pisces"
//        }

//        if newBirthday >= 2103 && newBirthday <= 1904 {
//            return "Aries"
//        } else if newBirthday >= 2004 && newBirthday <= 2005 {
//            return "Taurus"
//        } else if newBirthday >= 2105 && newBirthday <= 2106 {
//            return "Gemini"
//        } else if newBirthday >= 2206 && newBirthday <= 2207 {
//            return "Cancer"
//        } else if newBirthday >= 2307 && newBirthday <= 2208 {
//            return "Leo"
//        } else if newBirthday >= 2308 && newBirthday <= 2209 {
//            return "Virgo"
//        } else if newBirthday >= 2309 && newBirthday <= 2210 {
//            return "Libra"
//        } else if newBirthday >= 2310 && newBirthday <= 2211 {
//            return "Scorpio"
//        } else if newBirthday >= 2311 && newBirthday <= 2112 {
//            return "Sagittarius"
//        } else if newBirthday >= 2212 && newBirthday <= 1901 {
//            return "Capricorn"
//        } else if newBirthday >= 2001 && newBirthday <= 1802 {
//            return "Aquarius"
//        } else if newBirthday >= 1902 && newBirthday <= 2003 {
//            return "Pisces"
//        } else {
//            return pseudo
//        }
//    }
