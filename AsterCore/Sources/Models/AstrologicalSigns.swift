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

    static let comparaisonYear = 2020

    func startDate() -> DateComponents {
        switch self {
        case .aries:
            return DateComponents(year: Self.comparaisonYear, month: 3, day: 21+1)
        case .taurus:
            return DateComponents(year: Self.comparaisonYear, month: 4, day: 20+1)
        case .gemini:
            return DateComponents(year: Self.comparaisonYear, month: 5, day: 21+1)
        case .cancer:
            return DateComponents(year: Self.comparaisonYear, month: 6, day: 22+1)
        case .leo:
            return DateComponents(year: Self.comparaisonYear, month: 7, day: 23+1)
        case .virgo:
            return DateComponents(year: Self.comparaisonYear, month: 8, day: 23+1)
        case .libra:
            return DateComponents(year: Self.comparaisonYear, month: 9, day: 23+1)
        case .scorpio:
            return DateComponents(year: Self.comparaisonYear, month: 10, day: 23+1)
        case .sagittarius:
            return DateComponents(year: Self.comparaisonYear, month: 11, day: 23+1)
        case .capricorn:
            return DateComponents(year: Self.comparaisonYear, month: 12, day: 22+1)
        case .aquarius:
            return DateComponents(year: Self.comparaisonYear, month: 1, day: 20+1)
        case .pisces:
            return DateComponents(year: Self.comparaisonYear, month: 2, day: 19+1)
        }
    }

    func endDate() -> DateComponents {
        switch self {
        case .aries:
            return DateComponents(year: Self.comparaisonYear, month: 4, day: 19+1)
        case .taurus:
            return DateComponents(year: Self.comparaisonYear, month: 5, day: 20+1)
        case .gemini:
            return DateComponents(year: Self.comparaisonYear, month: 6, day: 21+1)
        case .cancer:
            return DateComponents(year: Self.comparaisonYear, month: 7, day: 22+1)
        case .leo:
            return DateComponents(year: Self.comparaisonYear, month: 8, day: 22+1)
        case .virgo:
            return DateComponents(year: Self.comparaisonYear, month: 9, day: 22+1)
        case .libra:
            return DateComponents(year: Self.comparaisonYear, month: 10, day: 22+1)
        case .scorpio:
            return DateComponents(year: Self.comparaisonYear, month: 11, day: 22+1)
        case .sagittarius:
            return DateComponents(year: Self.comparaisonYear, month: 12, day: 21+1)
        case .capricorn:
            return DateComponents(year: Self.comparaisonYear+1, month: 1, day: 19+1)
        case .aquarius:
            return DateComponents(year: Self.comparaisonYear, month: 2, day: 18+1)
        case .pisces:
            return DateComponents(year: Self.comparaisonYear, month: 3, day: 20+1)
        }
    }

    public static func sign(for month: Int, day: Int) -> AstrologicalSigns {
        guard let date = Calendar.current.date(from: DateComponents(year: self.comparaisonYear, month: month, day: day+1)) else {
            fatalError()
        }

        var foundedSign = AstrologicalSigns.aries

        AstrologicalSigns.allCases.forEach { sign in
            guard let start = Calendar.current.date(from: sign.startDate()), let end = Calendar.current.date(from: sign.endDate()) else {
                fatalError()
            }

            let signRange = start...end

            if signRange.contains(date) {
                foundedSign = sign
            }
        }

        return foundedSign
    }
}
