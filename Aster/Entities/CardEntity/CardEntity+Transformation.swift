//
//  CardEntity+Transformation.swift
//  Aster
//
//  Created by Alexandre Graverol on 31/08/2022.
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
