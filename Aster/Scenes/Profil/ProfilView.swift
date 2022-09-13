//
//  ProfilView.swift
//  Aster
//
//  Created by Alexandre Graverol on 24/08/2022.
//

import SwiftUI
import AsterCore

struct ProfilView: View {

    var user: User
    var card: Card

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

                Text(user.pseudo)
                    .font(.largeTitle)
                    .bold()

                Text(user.astrologicalSign)
                    .font(.title2)

                Spacer()

                Text(viewModel.savedCardsText)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .bold()

                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(alignment: .center, spacing: 20) {
                        ForEach(user.cards, id: \.name) {_ in
                            SavedCardView().onTapGesture {
                                self.navigateToLearnMore = true
                            }.sheet(isPresented: $navigateToLearnMore) {
                                TarotCardDetailView(card: card)
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

    static let cardsPreview = Card(name: "0_The_Fool", description: "")

    static let userPreview = User(pseudo: "James", dateOfBirth: "24/04", astrologicalSign: "Aries", cards: [cardsPreview, cardsPreview, cardsPreview])

    static var previews: some View {
        ProfilView(user: userPreview, card: cardsPreview)
    }
}
