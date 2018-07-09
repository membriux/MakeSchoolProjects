//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Memo on 7/7/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit
import CoreData

// Reference to the app delegate's managed object context
struct CoreDataHelper {
    static let context: NSManagedObjectContext =  {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    // Create a new note
    static func newNote() -> Note {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context) as! Note
        return note
    }
    
    // Save note
    static func saveNote() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    // Delete note
    static func deleteNote(note: Note) {
        context.delete(note)
        saveNote()
    }
    
    // Retrieve notes
    static func retrieveNotes() -> [Note]{
        do {
            // Retrieve all note Objects
            let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
            let results = try context.fetch(fetchRequest)
            
            return results
            
        } catch let error {
            print("Could not fetch \(error.localizedDescription))")
            
            return []
        }
    }
    
    
}









