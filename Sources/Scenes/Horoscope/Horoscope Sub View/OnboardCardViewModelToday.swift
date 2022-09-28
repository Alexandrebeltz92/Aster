//
//  OnboardCardViewModelToday.swift
//  Aster
//
//  Created by Alexandre Graverol on 28/09/2022.
//

import Foundation
import AsterCore

// MARK: - Class OnboardCardModelViewToday
class OnboardCardViewModelToday: ObservableObject {

    // MARK: - Properties
    @Published var horoscopeLabelToday = "Today"
    @Published var horoscopeOfTheDay = "Follow the stars, they're never wrong."

    let service: Service
    let store: UserStore

    // MARK: - Initialization
    init(service: Service = HoroscopeService(), store: UserStore = .instance) {
        self.service = service
        self.store = store
    }

    // MARK: - Functions
    func getHoroscope() {
        store.getPersistedUsers()

        guard let sign = store.users.first?.astrologicalSign else {
            fatalError("No sign founded")
        }

        service.getHoroscope(for: sign, for: "today") { [weak self] (result: Result<HoroscopeResponse?, ServiceError>) in
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
                    self.horoscopeOfTheDay = newHoroscope
                }

            case .failure:
                DispatchQueue.main.async {
                    self.horoscopeOfTheDay = "Sorry something went wrong, try again later."
                }
            }
        }
    }
}
