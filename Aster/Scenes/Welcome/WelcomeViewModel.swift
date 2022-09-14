//
//  WelcomeViewModel.swift
//  Aster
//
//  Created by Alexandre Graverol on 14/09/2022.
//

import Foundation

// MARK: - WelcomeViewModel
class WelcomeViewModel: ObservableObject {

    // MARK: - Properties
    @Published var background = "background"
    @Published var welcomeText = "Welcome to Aster!"
    @Published var catchText = "Let the stars guide you..."
    @Published var textButton = "Start now !"

}
