//
//  CoreDataService.swift
//  Aster
//
//  Created by Alexandre Graverol on 30/08/2022.
//

import Foundation

protocol CoreDataService {
    func getCards() -> [Card]

    func persist(card: Card)

    func delete(card: Card)
}
