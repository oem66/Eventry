//
//  CoreDataManager.swift
//  EventApp
//
//  Created by Omer Rahmanovic on 7/18/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit
import CoreData

final class CoreDataManager {
    lazy var persistantContainer: NSPersistentContainer =  {
        let persistantContainer = NSPersistentContainer(name: "EventApp")
        persistantContainer.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistantContainer
    }()
    
    var moc: NSManagedObjectContext {  //THIS IS OUR MANAGED OBJECT CONTEXT
        persistantContainer.viewContext
    }
    
    func saveEvent(name: String, date: Date, image: UIImage) {
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        event.setValue(date, forKey: "date")
        
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
    
    func fetchEvents() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let events = try moc.fetch(fetchRequest)
            return events
        } catch {
            print(error)
            return []
        }
    }
}
