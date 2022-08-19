//
//  HomeView.swift
//  Aster
//
//  Created by Alexandre Graverol on 17/08/2022.
//

import SwiftUI

struct HomeView: View {

    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
    }

    var body: some View {
        TabView {
            HoroscopeView()
                .tabItem {
                    Image(systemName: "wand.and.stars")
                        .foregroundColor(.red)
                }
            TarotCardView()
                .tabItem {
                    Image(systemName: "moon.stars")
                        .foregroundColor(.red)
                }
        }
        .accentColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
