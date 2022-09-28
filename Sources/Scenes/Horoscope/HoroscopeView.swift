//
//  HoroscopeView.swift
//  Aster
//
//  Created by Alexandre Graverol on 18/08/2022.
//

import SwiftUI

// MARK: - struct HoroscopeView
struct HoroscopeView: View {
    let viewModel = HoroscopeViewModel()

    var body: some View {
        ZStack {
            Image(viewModel.background)
                .ignoresSafeArea()
                .scaledToFill()

            TabView {
                OnboardCardViewYesterday(sign: "Aries")
                OnboardCardViewToday(sign: "Aries")
            }.tabViewStyle(PageTabViewStyle())
        }
    }
}

struct HoroscopeView_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeView()
    }
}
