//
//  LabelLoginView.swift
//  Aster
//
//  Created by Alexandre Graverol on 19/09/2022.
//

import SwiftUI
import AsterCore

struct LabelLoginView: View {

    func nextPage() {
        print("should go next page")
    }

    @Binding
    var viewModel: LoginViewModel

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Text("Please enter a pseudo")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.bottom, 18)

                TextField(viewModel.pseudo, text: $viewModel.pseudo)
                    .padding()
                    .background(lighGreyColor)
                    .cornerRadius(15)
                    .padding(15)

                Text("Swipe left to continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60, alignment: .center)
                    .background(Color.black)
                    .cornerRadius(35)
            }
        }
    }
}
