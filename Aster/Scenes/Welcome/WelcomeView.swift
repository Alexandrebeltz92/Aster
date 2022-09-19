//
//  WelcomeView.swift
//  Aster
//
//  Created by Alexandre Graverol on 12/09/2022.
//

import SwiftUI

struct WelcomeView: View {

    let loginViewModel = LoginViewModel()
    let viewModel = WelcomeViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Image(viewModel.background)
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(alignment: .center, spacing: 200) {
                    VStack {
                        Text(viewModel.welcomeText)
                            .font(.largeTitle)
                            .bold()
                        .foregroundColor(.white)

                        Text(viewModel.catchText)
                            .font(.callout)
                            .bold()
                            .foregroundColor(.white)
                    }

                    NavigationLink(destination: LoginView(viewModel: loginViewModel), label: {
                        Text(viewModel.textButton)
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
