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

// MARK: - Struct OnboardCardViewToday
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

// MARK: - Struct OnboardCardViewYesterday
struct OnboardCardViewYesterday: View {
    var sign: String
    @StateObject var viewModel = OnboardCardViewModelYesterday()

    var body: some View {
        VStack(alignment: .leading, spacing: 60) {
            Text(viewModel.horoscopeLabelYesterday)
                .bold()
                .font(.largeTitle)
                .foregroundColor(.black)
            Text(viewModel.horoscopeOfYesterday)
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
            viewModel.getHorosocpe()
        }
    }
}
