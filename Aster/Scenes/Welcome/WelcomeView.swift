//
//  WelcomeView.swift
//  Aster
//
//  Created by Alexandre Graverol on 12/09/2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(alignment: .center, spacing: 200) {
                    VStack {
                        Text("Welcome to Aster!")
                            .font(.largeTitle)
                            .bold()
                        .foregroundColor(.white)

                        Text("Let the stars guide you...")
                            .font(.callout)
                            .bold()
                            .foregroundColor(.white)
                    }

                    NavigationLink(destination: LoginView(), label: {
                        Text("Start now !")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 220, height: 60, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(35)
                    })
                }
            }.navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
