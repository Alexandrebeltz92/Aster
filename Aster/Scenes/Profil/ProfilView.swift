//
//  ProfilView.swift
//  Aster
//
//  Created by Alexandre Graverol on 24/08/2022.
//

import SwiftUI

struct ProfilView: View {

    let viewModel = ProfilViewModel()

    var body: some View {
        VStack {
            Spacer(minLength: 20)

            Image(viewModel.signImage)
                .resizable()
                .frame(width: 150, height: 150, alignment: .top)
                .clipShape(Circle())
                .shadow(radius: 15)
                .overlay(Circle().stroke(Color.black, lineWidth: 1))

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
                    ForEach(viewModel.cards, id: \.name) {card in
                        SavedCardView(card: card)
                    }
                }
            }

            Spacer()
        }
    }
}

struct SavedCardView: View {

    let card: Card

    var body: some View {
        Image("\(card.name)")
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
