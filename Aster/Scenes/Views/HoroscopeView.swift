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
                OnboardCardView()
                OnboardCardView()
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

struct OnboardCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 60) {
            Text("Horoscope")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("Hola")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text("JOjo")
        }
        .padding(30)
        .background(LinearGradient(gradient: .init(colors: [Color.blue, Color.white]), startPoint: UnitPoint.top, endPoint: UnitPoint.bottom)).opacity(30)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding(20)
    }
}
