//
//  ProfilView.swift
//  Aster
//
//  Created by Alexandre Graverol on 24/08/2022.
//

import SwiftUI

struct ProfilView: View {

    let modelView = ProfilModelView()

    var body: some View {
        VStack {
            Spacer(minLength: 20)

            Image("background1")
                .frame(width: 150, height: 150, alignment: .top)
                .clipShape(Circle())
                .shadow(radius: 15)
                .overlay(Circle().stroke(Color.black, lineWidth: 1))

            Spacer()

            Text(modelView.pseudo)
                .font(.largeTitle)
                .bold()
            
            Text(modelView.sign)
                .font(.title2)

            Spacer()

            HStack(alignment: .bottom, spacing: 25) {
                    Image(systemName: "star")
                    Image(systemName: "person")
                    Image(systemName: "cloud")
                    Image(systemName: "moon")
            }.foregroundColor(.blue)

            Spacer()
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
