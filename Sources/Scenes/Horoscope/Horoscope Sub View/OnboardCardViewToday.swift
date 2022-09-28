//
//  OnboardCardViewToday.swift
//  Aster
//
//  Created by Alexandre Graverol on 26/09/2022.
//

import SwiftUI

struct OnboardCardViewToday: View {
    var sign: String
    @StateObject var viewModel = OnboardCardViewModelToday()

    var body: some View {
        VStack(alignment: .leading, spacing: 60) {
            Text(viewModel.horoscopeLabelToday)
                .bold()
                .font(.largeTitle)
                .foregroundColor(.black)
            Text(viewModel.horoscopeOfTheDay)
                .minimumScaleFactor(0.2)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .frame(width: 250, height: 350, alignment: .center)
        .padding(30)
        .background(Color.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding(20)
        .onAppear {
            viewModel.getHoroscope()
        }
    }
}
