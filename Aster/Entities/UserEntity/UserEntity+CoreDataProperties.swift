//
//  UserEntity+CoreDataProperties.swift
//  Aster
//
//  Created by Alexandre Graverol on 31/08/2022.
//

import Foundation
import CoreData

extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var pseudo: String
    @NSManaged public var dateOfBirth: String
    @NSManaged public var sign: String

}

// MARK: Generated accessors for cards
extension UserEntity {

    @objc(addCardsObject:)
    @NSManaged public func addToCards(_ value: CardEntity)

    @objc(removeCardsObject:)
    @NSManaged public func removeFromCards(_ value: CardEntity)

    @objc(addCards:)
    @NSManaged public func addToCards(_ values: NSSet)

    @objc(removeCards:)
    @NSManaged public func removeFromCards(_ values: NSSet)
}

extension UserEntity: Identifiable {

}
