//
//  StorageProvider.swift
//  PracticalCoreData2
//
//  Created by Sahil Satralkar on 19/04/21.
//

import CoreData

class StorageProvider {
    
    let persistentContainer: NSPersistentContainer
    init() {
        persistentContainer = NSPersistentContainer(name:
                                                        "Model")
        persistentContainer.loadPersistentStores(completionHandler: { description, error in
            if let error = error {
                fatalError("Core Data store failed to load with error: \(error)") }
        })
    }
}
