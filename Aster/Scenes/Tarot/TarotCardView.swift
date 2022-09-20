//
//  TarotCardView.swift
//  Aster
//
//  Created by Alexandre Graverol on 18/08/2022.
//

import SwiftUI
import AsterCore

struct TarotCardView: View {

    // MARK: - Properties

    @StateObject
    var viewModel = TarotCardViewModel()

    let width: CGFloat = 250
    let height: CGFloat = 350
    let durationAndDelay: CGFloat = 0.3

    @State
    var backDegree = 0.0
    @State
    var frontDegree = -90.0
    @State
    var isFlipped = false
    @State
    private var navigateToLearnMore = false

    // MARK: - Functions
    func flipCard() {
        isFlipped = !isFlipped

        if isFlipped {
            viewModel.refreshCard()

            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                backDegree = 0
            }
        }
    }

    // MARK: - View
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
                .scaledToFill()

            VStack(alignment: .center, spacing: 15) {
                ZStack {
                    CardFront(width: width, height: height, card: $viewModel.cardToShow, degree: $frontDegree)
                    CardBack(width: width, height: height, degree: $backDegree)
                }
                if isFlipped {
                    withAnimation {
                        Button("Seek the truth") {
                            self.navigateToLearnMore = true
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60, alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(35)

                        .sheet(isPresented: $navigateToLearnMore) {
                            TarotCardDetailView(card: viewModel.cardToShow)
                        }
                    }
                }
            }.onTapGesture {
                flipCard()
        }
        }
    }
}

struct TarotCardView_Previews: PreviewProvider {

    static var previews: some View {
        TarotCardView()
    }
}
