//
//  TestCoreDataStack.swift
//  AsterCoreTests
//
//  Created by Alexandre Graverol on 12/09/2022.
//

import CoreData
@testable import AsterCore

class TestCoreDataStack: CoreDataStack {

  override init() {
    super.init()

    let persistentStoreDescription = NSPersistentStoreDescription()
    persistentStoreDescription.type = NSInMemoryStoreType

      let container = NSPersistentContainer(name: CoreDataStack.sharedInstance.persistentContainerName, managedObjectModel: CoreDataStack.sharedInstance.persistentContainer.managedObjectModel)

    container.persistentStoreDescriptions = [persistentStoreDescription]

    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }

    persistentContainer = container
  }
}
