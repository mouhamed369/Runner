//
//  Persistable.swift
//  Runner
//
//  Created by mohamed on 3/5/2023.
//

import Foundation
import CoreData

protocol Persistable {
    
    var context: NSManagedObjectContext { get }
    var container: NSPersistentContainer { get }
    
    func save()
    
}

