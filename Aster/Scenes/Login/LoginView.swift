//
//  LoginView.swift
//  Aster
//
//  Created by Alexandre Graverol on 25/08/2022.
//

import SwiftUI

let lighGreyColor = Color("LightGrey")

struct LoginView: View {

    let viewModel = LoginViewModel()

    @State var username: String = ""
    @State var birthday: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text(viewModel.catchPhrase)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.bottom, 20)

                Image("Logo")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .top)
                    .clipShape(Circle())
                    .shadow(radius: 15)
                    .overlay(Circle().stroke(Color.black, lineWidth: 1))

                Spacer()
                TextField(viewModel.pseudo, text: $username)
                    .padding()
                    .background(lighGreyColor)
                    .cornerRadius(15)
                    .padding(15)

                TextField(viewModel.dateOfBirth, text: $birthday)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(lighGreyColor)
                    .cornerRadius(15)
                    .padding(15)

                Spacer()
                VStack {
                    NavigationLink(destination: HomeView(), label: {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60, alignment: .center)
                            .background(Color.black)
                            .cornerRadius(35)
                    })
                }.simultaneousGesture(TapGesture().onEnded({
                    viewModel.save(user: $username)
                }))
                Spacer()
            }.navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
