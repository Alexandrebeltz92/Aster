//
//  HoroscopeView.swift
//  Aster
//
//  Created by Alexandre Graverol on 18/08/2022.
//

import SwiftUI

struct HoroscopeView: View {
    var body: some View {
        ZStack {
            Image("background1")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            TabView {
                OnboardCardViewToday()
                OnboardCardViewYesterday()
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct HoroscopeView_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeView()
    }
}

struct OnboardCardViewToday: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 60) {
            Text("Today")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.black)
            Text("Horoscope of the day")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
        }
        .padding(30)
        .background(Color.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding(20)
    }
}

struct OnboardCardViewYesterday: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 60) {
            Text("Yesterday")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.black)
            Text("Horoscope of yesterday")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
        }
        .padding(30)
        .background(Color.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding(20)
    }
}
