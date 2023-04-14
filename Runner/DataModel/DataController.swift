//
//  DataController.swift
//  SampleCoreData
//
//  Created by Federico on 18/02/2022.
//

import Foundation
import CoreData
import UIKit

class DataController: ObservableObject {
    // Responsible for preparing a model
    let managedContext: NSManagedObjectContext
    
    public static let instance: DataController = DataController()
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 1
        managedContext =
        appDelegate.persistentContainer.viewContext
        
        managedContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func getAll() -> [NSManagedObject] {
        //2
        let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Food")
        
        var result = [NSManagedObject]()
        
        do {
            result = try managedContext.fetch(fetchRequest)
        }
        catch _ as NSError {
            print("Error fetching data...")
        }
        
        return result;
    }
    
    func save() {
        do {
            try managedContext.save()
            print("Data saved successfully. WUHU!!!")
        } catch {
            // Handle errors in our database
            let nsError = error as NSError
            debugPrint("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addFood(name: String, calories: Double) {
        
        // 2
        let entity =
        NSEntityDescription.entity(forEntityName: "Food",
                                   in: managedContext)!
        
        let obj = NSManagedObject(entity: entity,
                                  insertInto: managedContext)
        
        
        obj.setValue(UUID(), forKeyPath: "id")
        obj.setValue(Date(), forKeyPath: "date")
        obj.setValue(name, forKeyPath: "name")
        obj.setValue(calories, forKeyPath: "calories")
        
        save()
    }
    
    func editFood(food: Food, name: String, calories: Double) {
        //2
        let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Food")
        
        fetchRequest.predicate = NSPredicate(
            format: "name LIKE %@", name
        )
        
        do {
            let result = try managedContext.fetch(fetchRequest).first
            
            if result == nil {
                return
            }
            
            result!.setValue(Date(), forKeyPath: "date")
            result!.setValue(name, forKeyPath: "name")
            result!.setValue(calories, forKeyPath: "calories")
            save()
        }
        catch _ as NSError {
            print("Error fetching data...")
        }
    }
}
