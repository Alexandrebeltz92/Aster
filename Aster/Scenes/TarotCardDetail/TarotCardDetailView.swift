//
//  TarotCardDetailView.swift
//  Aster
//
//  Created by Alexandre Graverol on 06/09/2022.
//

import SwiftUI
import AsterCore

struct TarotCardDetailView: View {

    var card: Card

    var body: some View {
        ZStack {
            Image(card.name)
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()

            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white.opacity(0.5))
                .frame(width: 300, height: 450)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            VStack(alignment: .center) {
                Text(card.description)
                    .minimumScaleFactor(0.2)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
        }
    }
}

struct TarotCardDetailView_Previews: PreviewProvider {

    static var cardPreview = Card(name: "0 The Fool", description: "Follow the wind")

    static var previews: some View {
        TarotCardDetailView(card: cardPreview)
    }
}
