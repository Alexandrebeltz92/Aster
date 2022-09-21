//
//  UserEntity+CoreDataProperties.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 13/09/2022.
//
//

import Foundation
import CoreData

public extension UserEntity {

    @nonobjc class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged var dateOfBirth: String
    @NSManaged var pseudo: String
    @NSManaged var sign: String
    @NSManaged var cards: NSSet

}

extension UserEntity: Identifiable {

}

// MARK: Generated accessors for cards
public extension UserEntity {

    @objc(addCardsObject:)
    @NSManaged func addToCards(_ value: CardEntity)

    @objc(removeCardsObject:)
    @NSManaged func removeFromCards(_ value: CardEntity)

    @objc(addCards:)
    @NSManaged func addToCards(_ values: NSSet)

    @objc(removeCards:)
    @NSManaged func removeFromCards(_ values: NSSet)
}
