//
//  Person.swift
//  Aster
//
//  Created by Alexandre Graverol on 17/08/2022.
//

import Foundation

struct Person {
    
    let pseudo: String
    let dateOfBirth: String
    let astrologicalSign: AstrologicalSigns
    
    func getSign() -> String {
        let birthday = dateOfBirth.replacingOccurrences(of: "/", with: "")
        guard let newBirthday = Int(birthday) else {
            return  pseudo
        }
        
        if newBirthday >= 2103 && newBirthday <= 1904 {
            return astrologicalSign.Aries
        } else if newBirthday >= 2004 && newBirthday <= 2005 {
            return astrologicalSign.Taurus
        } else if newBirthday >= 2105 && newBirthday <= 2106 {
            return astrologicalSign.Gemini
        } else if newBirthday >= 2206 && newBirthday <= 2207 {
            return astrologicalSign.Cancer
        } else if newBirthday >= 2307 && newBirthday <= 2208 {
            return astrologicalSign.Leo
        } else if newBirthday >= 2308 && newBirthday <= 2209 {
            return astrologicalSign.Virgo
        } else if newBirthday >= 2309 && newBirthday <= 2210 {
            return astrologicalSign.Libra
        } else if newBirthday >= 2310 && newBirthday <= 2211 {
            return astrologicalSign.Scorpio
        } else if newBirthday >= 2311 && newBirthday <= 2112 {
            return astrologicalSign.Sagittarius
        } else if newBirthday >= 2212 && newBirthday <= 1901 {
            return astrologicalSign.Capricorn
        } else if newBirthday >= 2001 && newBirthday <= 1802 {
            return astrologicalSign.Aquarius
        } else if newBirthday >= 1902 && newBirthday <= 2003 {
            return astrologicalSign.Pisces
        } else {
            return pseudo
        }
    }
}
