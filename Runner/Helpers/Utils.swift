//
//  Utils.swift
//  Runner
//
//  Created by mohamed on 14/4/2023.
//

import Foundation
import UIKit
import CoreData

func getContext() -> NSManagedObjectContext {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // 1
    let managedContext =
    appDelegate.persistentContainer.viewContext
    
    managedContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    
    return managedContext
}
