//
//  TarotCardDetailView.swift
//  Aster
//
//  Created by Alexandre Graverol on 06/09/2022.
//

import SwiftUI

struct TarotCardDetailView: View {
//    @StateObject var viewModel = TarotCardDetailViewModel(card: card)

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()

            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: 300, height: 450)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            VStack(alignment: .center, spacing: 60) {
                Text("viewModel.name")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.blue)

                Text("viewModel.description")
                    .minimumScaleFactor(0.2)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
        }
    }
}

struct TarotCardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TarotCardDetailView()
    }
}
