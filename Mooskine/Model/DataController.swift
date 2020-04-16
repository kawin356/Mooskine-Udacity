//
//  DataController.swift
//  Mooskine
//
//  Created by Kittikawin Sontinarakul on 16/4/2563 BE.
//  Copyright © 2563 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    
    static let shared = DataController(modelName: "DataModel")
    
    let persistentController: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentController.viewContext
    }
    
    private init(modelName: String) {
        self.persistentController = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentController.loadPersistentStores { (storeDiscription, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            completion?()
            self.autoSaveContext(interval: 3)
        }
    }
}

extension DataController {
    func autoSaveContext(interval: TimeInterval) {
        print("Auto Save Context")
        if viewContext.hasChanges {
            try? viewContext.save()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveContext(interval: interval)
        }
    }
}
