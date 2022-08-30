//
//  LoginView.swift
//  Aster
//
//  Created by Alexandre Graverol on 25/08/2022.
//

import SwiftUI

let lighGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct LoginView: View {

    @State var username: String = ""
    @State var birthday: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("The stars greet you!")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.bottom, 20)
                Image("background1")
                    .frame(width: 150, height: 150, alignment: .top)
                    .clipShape(Circle())
                    .shadow(radius: 15)
                    .overlay(Circle().stroke(Color.black, lineWidth: 1))
                Spacer()
                TextField("Username", text: $username)
                    .padding()
                    .background(lighGreyColor)
                    .cornerRadius(15)
                    .padding(15)
                TextField("Birthday : 20/03/2000", text: $birthday)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(lighGreyColor)
                    .cornerRadius(15)
                    .padding(15)
                Spacer()
                NavigationLink(destination: HomeView(), label: {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60, alignment: .center)
                        .background(Color.black)
                        .cornerRadius(35)
                })
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
