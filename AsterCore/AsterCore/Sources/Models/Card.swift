//
//  Card.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation
import SwiftUI

public struct Card {
    public let name: String
    public let imageName: String
    public let description: String
    public let saved: Bool

    public init(name: String, imageName: String, description: String, saved: Bool) {
        self.name = name
        self.imageName = imageName
        self.description = description
        self.saved = saved
    }
}

extension Card: Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(imageName)
    }

    static public func == (lhs: Card, rhs: Card) -> Bool {
        (lhs.name, lhs.imageName) == (rhs.name, rhs.imageName)
    }
}
