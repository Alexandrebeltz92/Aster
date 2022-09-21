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
            Image("background")
                .ignoresSafeArea()
                .scaledToFill()

            VStack {
                Spacer(minLength: 20)
                    .padding()

                Image(viewModel.signImage)
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .top)
                    .clipShape(Circle())
                    .shadow(radius: 15)
                    .overlay(Circle().stroke(Color.blue, lineWidth: 0.5))

                Spacer()

                Text(user.pseudo)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()

                Text(user.astrologicalSign)
                    .foregroundColor(.white)
                    .font(.title2)

                Spacer()
                    .padding()

                Text(viewModel.savedCardsText)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .bold()

                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(alignment: .center, spacing: 15) {
                        ForEach(user.cards, id: \.name) {_ in
                            SavedCardView(card: card).onTapGesture {
                                self.navigateToLearnMore = true
                            }.sheet(isPresented: $navigateToLearnMore) {
                                TarotCardDetailView(card: card)
                            }
                        }
                    }
                }

                Spacer(minLength: 20)
                    .padding()
            }
        }
    }
}

struct ProfilView_Previews: PreviewProvider {

    static let cardsPreview = Card(name: "0 The Fool", imageName: "0_The_Fool", description: "Have fun sugar", saved: true)

    static let userPreview = User(pseudo: "James", astrologicalSign: "Aries", cards: [cardsPreview, cardsPreview, cardsPreview])

    static var previews: some View {
        ProfilView(user: userPreview, card: cardsPreview)
    }
}
