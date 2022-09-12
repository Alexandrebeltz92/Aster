//
//  CardEntity+Transformation.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import CoreData

extension CardEntity {

    func toCard() -> Card {
        return Card(name: name)
    }
}

extension Card {

    func toEntity(context: NSManagedObjectContext) -> CardEntity {

        guard let entity = NSEntityDescription.entity(forEntityName: "CardEntity", in: context) else {
            fatalError("Entity model must be configured")
        }

        let cardEntity = CardEntity(entity: entity, insertInto: context)
        cardEntity.name = name

        return cardEntity
    }
}