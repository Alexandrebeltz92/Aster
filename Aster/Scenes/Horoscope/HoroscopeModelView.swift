//
//  HoroscopeModelView.swift
//  Aster
//
//  Created by Alexandre Graverol on 19/08/2022.
//

import Foundation

extension HoroscopeView {
    class HoroscopeModelView: ObservableObject {
    }
}

extension OnboardCardViewToday {
    class OnboardCardModelViewToday: ObservableObject {
        // MARK: - Properties
        @Published var horoscopeLabelToday = "Today"
        @Published var horoscopeOfTheDay = "Follow the stars, they're never wrong."

        let service = HoroscopeService()

        // MARK: - Functions
        func getHorosocpe() {
            service.getHoroscope(for: "aries", for: "today") { [weak self] (result: Result<HoroscopeResponse?, ServiceError>) in
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

                case .failure(_):
                    print("something went wrong")
                }
            }
        }
    }
}

extension OnboardCardViewYesterday {
    class OnboardCardModelViewYesterday: ObservableObject {
        @Published var horoscopeLabelYesterday = "Yesterday"
        @Published var horoscopeOfYesterday = "The Sun is looking down on you."

        let service = HoroscopeService()

        // MARK: - Functions
        func getHorosocpe() {
            service.getHoroscope(for: "aries", for: "yesterday") { [weak self] (result: Result<HoroscopeResponse?, ServiceError>) in
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

                case .failure(_):
                    print("something went wrong")
                }
            }
        }
    }
}
