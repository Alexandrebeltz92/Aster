//
//  ProfilView.swift
//  Aster
//
//  Created by Alexandre Graverol on 24/08/2022.
//

import SwiftUI
import AsterCore

struct ProfilView: View {

    @ObservedObject
    var viewModel = ProfilViewModel()

    @State private var navigateToLearnMore = false

    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
                .scaledToFill()

            VStack {
                Spacer(minLength: 20)
                    .padding()

                Image(viewModel.userToDisplay.astrologicalSign)
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .top)
                    .clipShape(Circle())
                    .shadow(radius: 15)
                    .overlay(Circle().stroke(Color.blue, lineWidth: 0.5))

                Spacer()

                Text(viewModel.userToDisplay.pseudo)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()

                Spacer()
                    .padding()

                if !viewModel.userToDisplay.cards.isEmpty {
                    Text(viewModel.savedCardsText)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .bold()

                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .center, spacing: 15) {
                            ForEach(viewModel.userToDisplay.cards, id: \.name) {card in
                                SavedCardView(card: card).onTapGesture {
                                    self.navigateToLearnMore = true
                                }.sheet(isPresented: $navigateToLearnMore) {
                                    TarotCardDetailView(card: card)
                                }
                            }
                        }.padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 100))
                            .onAppear(perform: viewModel.refreshUser)
                    }
                }

                Spacer(minLength: 20)
                    .padding()
            }
        }
        .onAppear(perform: viewModel.refreshUser)
    }
}

struct ProfilView_Previews: PreviewProvider {

    static var previews: some View {
        ProfilView()
    }
}
