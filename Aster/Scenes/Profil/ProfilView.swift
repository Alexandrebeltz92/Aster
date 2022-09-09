//
//  ProfilView.swift
//  Aster
//
//  Created by Alexandre Graverol on 24/08/2022.
//

import SwiftUI

struct ProfilView: View {

    let viewModel = ProfilViewModel()
    @State private var navigateToLearnMore = false

    var body: some View {
        ZStack {
            VStack {
                Spacer(minLength: 20)

                Image(viewModel.signImage)
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .top)
                    .clipShape(Circle())
                    .shadow(radius: 15)
                    .overlay(Circle().stroke(Color.blue, lineWidth: 0.5))

                Spacer()

                Text(viewModel.pseudo)
                    .font(.largeTitle)
                    .bold()

                Text(viewModel.sign)
                    .font(.title2)

                Spacer()

                Text(viewModel.savedCardsText)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .bold()

                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(alignment: .center, spacing: 20) {
                        ForEach(viewModel.cards, id: \.name) {_ in
                            SavedCardView().onTapGesture {
                                self.navigateToLearnMore = true
                            }.sheet(isPresented: $navigateToLearnMore) {
                                TarotCardDetailView()
                            }
                        }
                    }
                }

                Spacer(minLength: 20)
            }
        }
    }
}

struct SavedCardView: View {

    var body: some View {
        Image("0_The_Fool")
            .resizable()
            .frame(width: 100, height: 200, alignment: .center)
            .cornerRadius(25)
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
