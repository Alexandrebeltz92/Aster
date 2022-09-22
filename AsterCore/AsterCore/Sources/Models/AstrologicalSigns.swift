//
//  AstrologicalSigns.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation

public enum AstrologicalSigns: String, CaseIterable {
    // March 21 - April 19
    case aries
    // April 20 – May 20
    case taurus
    // May 21 – June 21
    case gemini
    // June 22 – July 22
    case cancer
    // July 23 – August 22
    case leo
    // August 23 – September 22
    case virgo
    // September 23 – October 22
    case libra
    // October 23 – November 22
    case scorpio
    // November 23 – December 21
    case sagittarius
    // December 22 – January 19
    case capricorn
    // January 20 – February 18
    case aquarius
    // February 19 – March 20
    case pisces

    static var comparaisonYear = 2020

    func startDate() -> Date? {
        switch self {
        case .aries:
            return DateComponents(year: Self.comparaisonYear, month: 3, day: 21).date
        case .taurus:
            return DateComponents(year: Self.comparaisonYear, month: 4, day: 20).date
        case .gemini:
            return DateComponents(year: Self.comparaisonYear, month: 5, day: 21).date
        case .cancer:
            return DateComponents(year: Self.comparaisonYear, month: 6, day: 22).date
        case .leo:
            return DateComponents(year: Self.comparaisonYear, month: 7, day: 23).date
        case .virgo:
            return DateComponents(year: Self.comparaisonYear, month: 8, day: 23).date
        case .libra:
            return DateComponents(year: Self.comparaisonYear, month: 9, day: 23).date
        case .scorpio:
            return DateComponents(year: Self.comparaisonYear, month: 10, day: 23).date
        case .sagittarius:
            return DateComponents(year: Self.comparaisonYear, month: 11, day: 23).date
        case .capricorn:
            return DateComponents(year: Self.comparaisonYear, month: 12, day: 22).date
        case .aquarius:
            return DateComponents(year: Self.comparaisonYear, month: 1, day: 20).date
        case .pisces:
            return DateComponents(year: Self.comparaisonYear, month: 2, day: 19).date
        }
    }

    func endDate() -> Date? {
        switch self {
        case .aries:
            return DateComponents(year: Self.comparaisonYear, month: 4, day: 19).date
        case .taurus:
            return DateComponents(year: Self.comparaisonYear, month: 5, day: 20).date
        case .gemini:
            return DateComponents(year: Self.comparaisonYear, month: 6, day: 21).date
        case .cancer:
            return DateComponents(year: Self.comparaisonYear, month: 7, day: 22).date
        case .leo:
            return DateComponents(year: Self.comparaisonYear, month: 8, day: 22).date
        case .virgo:
            return DateComponents(year: Self.comparaisonYear, month: 9, day: 22).date
        case .libra:
            return DateComponents(year: Self.comparaisonYear, month: 10, day: 22).date
        case .scorpio:
            return DateComponents(year: Self.comparaisonYear, month: 11, day: 22).date
        case .sagittarius:
            return DateComponents(year: Self.comparaisonYear, month: 12, day: 21).date
        case .capricorn:
            return DateComponents(year: Self.comparaisonYear, month: 1, day: 19).date
        case .aquarius:
            return DateComponents(year: Self.comparaisonYear, month: 2, day: 18).date
        case .pisces:
            return DateComponents(year: Self.comparaisonYear, month: 3, day: 20).date
        }
    }

    public static func sign(for month: Int, day: Int) -> AstrologicalSigns {
        guard let date = DateComponents(year: Self.comparaisonYear, month: month, day: day).date else {
            fatalError("dateComponents isnt working correctly")
        }

        var foundedSign = AstrologicalSigns.aries

        AstrologicalSigns.allCases.forEach { sign in
            let signRange = sign.startDate()!...sign.endDate()!

            if signRange.contains(date) {
                foundedSign = sign
            }
        }

        return foundedSign
    }
}
