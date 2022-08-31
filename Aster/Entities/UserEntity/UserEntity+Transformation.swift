//
//  UserEntity+Transformation.swift
//  Aster
//
//  Created by Alexandre Graverol on 31/08/2022.
//

import CoreData

extension UserEntity {

    func toUser() -> User {
        guard let cardsEntities = cards.allObjects as? [CardEntity] else {
            fatalError()
        }

        return User(pseudo: pseudo,
                    dateOfBirth: dateOfBirth,
                    astrologicalSign: sign,
                    cards: cardsEntities.map { $0.toCard() })
    }
}

extension User {

    func toEntity(context: NSManagedObjectContext) -> UserEntity {
        guard let entity = NSEntityDescription.entity(forEntityName: "UserEntity", in: context) else {
            fatalError("Entity model must be configured")
        }

        let userEntity = UserEntity(entity: entity, insertInto: context)
        userEntity.pseudo = pseudo
        userEntity.dateOfBirth = dateOfBirth
        userEntity.sign = astrologicalSign

        return userEntity
    }
}
