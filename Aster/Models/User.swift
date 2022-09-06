//
//  User.swift
//  Aster
//
//  Created by Alexandre Graverol on 17/08/2022.
//

import Foundation

struct User {

    let pseudo: String
    let dateOfBirth: String
    let astrologicalSign: String
    let cards: [Card]

    func getAstroSign() -> String {
        let birthday = dateOfBirth.replacingOccurrences(of: "/", with: "")
        guard let newBirthday = Int(birthday) else {
            return  pseudo
        }

        if newBirthday >= 2103 && newBirthday <= 1904 {
            return "Aries"
        } else if newBirthday >= 2004 && newBirthday <= 2005 {
            return "Taurus"
        } else if newBirthday >= 2105 && newBirthday <= 2106 {
            return "Gemini"
        } else if newBirthday >= 2206 && newBirthday <= 2207 {
            return "Cancer"
        } else if newBirthday >= 2307 && newBirthday <= 2208 {
            return "Leo"
        } else if newBirthday >= 2308 && newBirthday <= 2209 {
            return "Virgo"
        } else if newBirthday >= 2309 && newBirthday <= 2210 {
            return "Libra"
        } else if newBirthday >= 2310 && newBirthday <= 2211 {
            return "Scorpio"
        } else if newBirthday >= 2311 && newBirthday <= 2112 {
            return "Sagittarius"
        } else if newBirthday >= 2212 && newBirthday <= 1901 {
            return "Capricorn"
        } else if newBirthday >= 2001 && newBirthday <= 1802 {
            return "Aquarius"
        } else if newBirthday >= 1902 && newBirthday <= 2003 {
            return "Pisces"
        } else {
            return pseudo
        }
    }
}

extension User: Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(pseudo)
        hasher.combine(dateOfBirth)
        hasher.combine(astrologicalSign)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        (lhs.pseudo, lhs.dateOfBirth,
         lhs.astrologicalSign, lhs.cards) == (rhs.pseudo, rhs.dateOfBirth, rhs.astrologicalSign, rhs.cards)
    }
}
