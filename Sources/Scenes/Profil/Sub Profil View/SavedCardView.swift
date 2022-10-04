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

    var cardImage: UIImage {
        if let image = UIImage(named: card.imageName.capitalized) {
            return image
        } else {
            guard let defaultImage = UIImage(named: "aries") else {
                fatalError("Default image must be inside ressoruces")
            }

            return defaultImage
        }
    }

    var body: some View {
        Image(uiImage: cardImage)
            .resizable()
            .frame(width: 100, height: 200, alignment: .center)
            .cornerRadius(25)
    }
}
