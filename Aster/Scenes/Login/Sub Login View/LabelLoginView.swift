//
//  LabelLoginView.swift
//  Aster
//
//  Created by Alexandre Graverol on 19/09/2022.
//

import SwiftUI
import AsterCore

struct LabelLoginView: View {

    @Binding
    var viewModel: LoginViewModel

    var tapOnNextButtonHandler: () -> Void

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .opacity(0.9)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50, alignment: .center)

                Text("Please enter a pseudo")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }

            TextField(viewModel.pseudo, text: $viewModel.pseudo)
                .padding()
                .background(lighGreyColor)
                .cornerRadius(15)
                .padding(15)

            Button("Next") {
                tapOnNextButtonHandler()
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60, alignment: .center)
            .background(Color.black)
            .cornerRadius(35)
        }
    }
}
