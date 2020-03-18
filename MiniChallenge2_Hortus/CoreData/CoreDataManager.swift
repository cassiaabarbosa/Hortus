//
//  CoreDataManager.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 29/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataManager {
    static let shared = CoreDataManager()
    private init(){}
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "HortusModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    //     MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func context () -> NSManagedObjectContext {
        let context = persistentContainer.viewContext
        return context
    }
    
    func delete(plant: Plant?) -> Void {
        let moc = context()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Plant")

         let result = try? moc.fetch(fetchRequest)
            let resultData = result as! [Plant]

            for i in resultData {
                if let result = plant {
                    moc.delete(result)
                }
                
            }

            do {
                try moc.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {

            }

    }

}
