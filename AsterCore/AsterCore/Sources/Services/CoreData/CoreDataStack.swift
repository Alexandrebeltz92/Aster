//
//  CoreDataStack.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation
import CoreData

public class CoreDataStack {

    // MARK: - Properties
     public let persistentContainerName = "Aster"

     // MARK: - Singleton
     static let sharedInstance = CoreDataStack()

     // MARK: - Public
     var viewContext: NSManagedObjectContext {
         return CoreDataStack.sharedInstance.persistentContainer.viewContext
     }

     // MARK: - Private
     public init() {

     }

     public lazy var persistentContainer: NSPersistentContainer = {
         let coreBundle = Bundle(for: Self.self)

         guard
            let modelURL = coreBundle.url(forResource: "Aster", withExtension: "momd"),
            let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
             fatalError("Should not happen")
         }

         let container = NSPersistentContainer(name: persistentContainerName, managedObjectModel: managedObjectModel)
         container.loadPersistentStores(completionHandler: { storeDescription, error in
             if let error = error as NSError? {
                 fatalError("Unresolved error \(error), \(error.userInfo) for: \(storeDescription.description)")
             }
         })
         return container
     }()
 }
