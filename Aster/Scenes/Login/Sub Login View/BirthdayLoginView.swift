//
//  BirthdayLoginView.swift
//  Aster
//
//  Created by Alexandre Graverol on 19/09/2022.
//

import SwiftUI
import AsterCore

struct BirthdayLoginView: View {

    @Binding
    var viewModel: LoginViewModel

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .opacity(0.9)
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50, alignment: .center)

                Text("Please enter your birthday")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }

            HStack {
                TextField(viewModel.dayOfBirth, text: $viewModel.dayOfBirth)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(lighGreyColor)
                    .cornerRadius(15)
                    .keyboardType(.numberPad)

                TextField(viewModel.monthOfBirth, text: $viewModel.monthOfBirth)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(lighGreyColor)
                    .cornerRadius(15)
                    .keyboardType(.numberPad)
            }.padding(15)

            NavigationLink(destination: HomeView(), label: {
                Text("Lets start")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60, alignment: .center)
                    .background(Color.black)
                    .cornerRadius(35)
            }).simultaneousGesture(TapGesture().onEnded {
                viewModel.save()
            })
        }
    }
}
