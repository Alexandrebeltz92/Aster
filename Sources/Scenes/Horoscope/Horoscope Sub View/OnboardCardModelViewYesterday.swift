//
//  OnboardCardModelViewYesterday.swift
//  Aster
//
//  Created by Alexandre Graverol on 28/09/2022.
//

import Foundation
import AsterCore

// MARK: - Class OnboardCardModelViewYesterday
class OnboardCardViewModelYesterday: ObservableObject {

    // MARK: - Properties
    @Published var horoscopeLabelYesterday = "Yesterday"
    @Published var horoscopeOfYesterday = "The Sun is looking down on you."

    let service = HoroscopeService()
    let store = UserStore.instance

    // MARK: - Functions
    func getHorosocpe() {
        store.getPersistedUsers()

        guard let sign = store.users.first?.astrologicalSign else {
            fatalError("No sign founded")
        }

        service.getHoroscope(for: sign, for: "yesterday") { [weak self] (result: Result<HoroscopeResponse?, ServiceError>) in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let response):
                guard let response = response else {
                    return
                }

                let horoscope = response.text.replacingOccurrences(of: "<span style=\"font-weight: 400\">", with: "")
                let newHoroscope = horoscope.replacingOccurrences(of: "</span>", with: "")

                DispatchQueue.main.async {
                    self.horoscopeOfYesterday = newHoroscope
                }

            case .failure:
                print("something went wrong")
            }
        }
    }
}

