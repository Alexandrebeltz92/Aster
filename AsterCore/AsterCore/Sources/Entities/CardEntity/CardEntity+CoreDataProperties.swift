//
//  CardEntity+CoreDataProperties.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 13/09/2022.
//
//

import Foundation
import CoreData

public extension CardEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CardEntity> {
        return NSFetchRequest<CardEntity>(entityName: "CardEntity")
    }

    @NSManaged var name: String
    @NSManaged var descriptionCard: String
    @NSManaged var imageName: String
    @NSManaged var user: UserEntity?

}

extension CardEntity: Identifiable {

}
