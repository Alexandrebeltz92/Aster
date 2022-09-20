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
    var username = ""
    @State
    var birthday = ""
    @State
    var birthMonth = ""

    var body: some View {
        NavigationView {
            TabView {
                LabelLoginView(viewModel: $viewModel)
                BirthdayLoginView(viewModel: $viewModel)
            }.tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
