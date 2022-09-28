//
//  LoginView.swift
//  Aster
//
//  Created by Alexandre Graverol on 25/08/2022.
//

import SwiftUI
import AsterCore

let lighGreyColor = Color("LightGrey")

struct LoginView: View {

    @State
    var viewModel: LoginViewModel

    @State
    var selectedTab = 0

    @State
    var username = ""
    @State
    var birthday = ""
    @State
    var birthMonth = ""

    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()

                VStack(alignment: .center, spacing: 200) {
                    TabView(selection: $selectedTab) {
                        LabelLoginView(viewModel: $viewModel) {
                            withAnimation {
                                selectedTab = 1
                            }
                        }.tag(0)
                        BirthdayLoginView(viewModel: $viewModel)
                            .tag(1)
                    }.tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                }
            }
        }.navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
