//
//  SavedCardView.swift
//  Aster
//
//  Created by Alexandre Graverol on 20/09/2022.
//

import SwiftUI
import AsterCore

struct SavedCardView: View {

    var card: Card

    var body: some View {
        Image(card.imageName)
            .resizable()
            .frame(width: 100, height: 200, alignment: .center)
            .cornerRadius(25)
    }
}
