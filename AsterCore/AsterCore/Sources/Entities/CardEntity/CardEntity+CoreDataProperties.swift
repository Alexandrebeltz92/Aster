//
//  CardEntity+CoreDataProperties.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 13/09/2022.
//
//

import Foundation
import CoreData

extension CardEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CardEntity> {
        return NSFetchRequest<CardEntity>(entityName: "CardEntity")
    }

    @NSManaged public var name: String
    @NSManaged public var context: String
    @NSManaged public var user: UserEntity?

}

extension CardEntity: Identifiable {

}
