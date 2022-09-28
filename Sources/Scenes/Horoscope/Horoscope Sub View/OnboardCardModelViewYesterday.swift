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

    let service: Service
    let store: UserStore

    // MARK: - Initialization
    init(service: Service = HoroscopeService(), store: UserStore = .instance) {
        self.service = service
        self.store = store
    }

    // MARK: - Functions
    func getHoroscope(completionHandler: @escaping (Result<String, ServiceError>) -> Void) {
        store.getPersistedUsers()

        guard let sign = store.users.first?.astrologicalSign else {
            fatalError("No sign founded")
        }

        service.getHoroscope(for: sign, for: "yesterday") { (result: Result<HoroscopeResponse?, ServiceError>) in
            switch result {
            case .success(let response):
                guard let response = response else {
                    return
                }

                let horoscope = response.text.replacingOccurrences(of: "<span style=\"font-weight: 400\">", with: "")
                let newHoroscope = horoscope.replacingOccurrences(of: "</span>", with: "")

                completionHandler(.success(newHoroscope))

            case .failure:
                completionHandler(.failure(.unknown))
            }
        }
    }
}
