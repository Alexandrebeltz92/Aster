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
            Image(card.imageName)
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()

            VStack(alignment: .center) {
                Text(card.description)
                    .minimumScaleFactor(0.2)
                    .font(.subheadline)
                    .foregroundColor(.black)

            }.frame(width: 250, height: 350, alignment: .center)
                .padding(30)
                .background(Color.white)
                .opacity(0.9)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .padding(20)
        }
    }
}

struct TarotCardDetailView_Previews: PreviewProvider {

    static var cardPreview = Card(name: "0 The Fool", imageName: "0_The_Fool", description: "Follow the wind")

    static var previews: some View {
        TarotCardDetailView(card: cardPreview)
    }
}
