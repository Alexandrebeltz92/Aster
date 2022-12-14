//
//  CardFront.swift
//  Aster
//
//  Created by Alexandre Graverol on 18/08/2022.
//

import SwiftUI
import AsterCore

struct CardFront: View {

    let width: CGFloat
    let height: CGFloat

    @Binding
    var card: Card

    @Binding
    var degree: Double

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            Image(card.imageName)
                .resizable()
                .frame(width: 250, height: 350, alignment: .center)
                .cornerRadius(20)
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
