//
//  HoroscopeView.swift
//  Aster
//
//  Created by Alexandre Graverol on 18/08/2022.
//

import SwiftUI

struct HoroscopeView: View {
    @StateObject var viewModel = HoroscopeModelView()

    var body: some View {
        ZStack {
            Image("background1")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            TabView {
                OnboardCardViewToday(sign: "Leo")
                OnboardCardViewYesterday(sign: "Leo")
            }.tabViewStyle(PageTabViewStyle())
        }
    }
}

struct HoroscopeView_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeView()
    }
}

struct OnboardCardViewToday: View {
    var sign: String
    @StateObject var viewModel = OnboardCardModelViewToday()

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
        .onAppear() {
            viewModel.getHoroscope(for: sign)
        }
    }
}

struct OnboardCardViewYesterday: View {
    var sign: String
    @StateObject var viewModel = OnboardCardModelViewYesterday()

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
        .onAppear() {
            viewModel.getHorosocpe(for: sign)
        }
    }
}