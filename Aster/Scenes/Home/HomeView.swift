//
//  HomeView.swift
//  Aster
//
//  Created by Alexandre Graverol on 17/08/2022.
//

import SwiftUI
import AsterCore

struct HomeView: View {

    var user = User(pseudo: "James", dateOfBirth: "", astrologicalSign: "", cards: [Card(name: "", description: "")])

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

                ProfilView(user: user)
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
