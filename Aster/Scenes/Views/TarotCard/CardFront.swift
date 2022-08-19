//
//  CardFront.swift
//  Aster
//
//  Created by Alexandre Graverol on 18/08/2022.
//

import SwiftUI

struct CardFront: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            Image(systemName: "suit.club.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.red)
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
