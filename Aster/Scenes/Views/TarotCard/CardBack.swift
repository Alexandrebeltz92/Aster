//
//  CardBack.swift
//  Aster
//
//  Created by Alexandre Graverol on 18/08/2022.
//

import SwiftUI

struct CardBack: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)

            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                .background(Image("TarotCardBack3").resizable()).cornerRadius(20)
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
