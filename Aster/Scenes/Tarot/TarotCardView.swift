//
//  TarotCardView.swift
//  Aster
//
//  Created by Alexandre Graverol on 18/08/2022.
//

import SwiftUI

struct TarotCardView: View {
    // MARK: - Properties
    @StateObject var viewModel = TarotCardViewModel()

    let width: CGFloat = 250
    let height: CGFloat = 350
    let durationAndDelay: CGFloat = 0.3
    
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    @State private var navigateToLearnMore = false
    
    // MARK: - Functions
    func flipCard() {
        isFlipped = !isFlipped
        if isFlipped {
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
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            ZStack {
                Image("background")
                    .ignoresSafeArea()
                    .scaledToFill()

                CardFront(width: width, height: height, degree: $frontDegree)
                CardBack(width: width, height: height, degree: $backDegree)
                
                Button("Seek the truth") {
                    self.navigateToLearnMore = true
                }.sheet(isPresented: $navigateToLearnMore) {
                    TarotCardDetailView()
                }
            }
            
            // TODO: cant figure how to place it
           
        }.onTapGesture {
            flipCard()
        }
    }
}

struct TarotCardView_Previews: PreviewProvider {
    static var previews: some View {
        TarotCardView()
    }
}
