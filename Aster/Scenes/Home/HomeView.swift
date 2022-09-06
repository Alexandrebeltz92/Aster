//
//  HomeView.swift
//  Aster
//
//  Created by Alexandre Graverol on 17/08/2022.
//

import SwiftUI

struct HomeView: View {

    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }

    var body: some View {
        NavigationView {
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

                ProfilView()
                    .tabItem {
                        Image(systemName: "person")
                            .foregroundColor(.red)
                    }
            }.navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
