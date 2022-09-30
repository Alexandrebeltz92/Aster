//
//  TarotCardDetailView.swift
//  Aster
//
//  Created by Alexandre Graverol on 06/09/2022.
//

import SwiftUI
import AsterCore

struct TarotCardDetailView: View {

    @State
    private var isSaved = false
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

                if card.saved {
                    Button("Remove") {
                        withAnimation {
                            self.isSaved = false
                        }

                        TarotCardDetailViewModel(card: card).removeCard()
                    }
                    .padding(30)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(35)
                    .opacity(isSaved ? 1 : 0)
                    .disabled(!isSaved)
                }

                if !card.saved {
                    Button("Save your card") {
                        withAnimation {
                            self.isSaved = true
                        }

                        TarotCardDetailViewModel(card: card).saveCard()
                    }.padding(30)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60, alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(35)
                        .opacity(isSaved ? 0 : 1)
                        .disabled(isSaved)

                }
            }.frame(width: 250, height: 350, alignment: .center)
                .padding(30)
                .background(Color.white)
                .opacity(0.9)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .padding(20)
        }.onAppear {
            if TarotCardDetailViewModel(card: card).checkIfSaved(for: card) {
                isSaved = true
            }
        }
        .onAppear {
            if TarotCardDetailViewModel(card: card).checkIfSaved(for: card) {
                isSaved = true
            }
        }
    }
}

struct TarotCardDetailView_Previews: PreviewProvider {

    static var cardPreview = Card(name: "0 The Fool", imageName: "0_The_Fool", description: "Follow the wind", saved: false)

    static var previews: some View {
        TarotCardDetailView(card: cardPreview)
    }
}
