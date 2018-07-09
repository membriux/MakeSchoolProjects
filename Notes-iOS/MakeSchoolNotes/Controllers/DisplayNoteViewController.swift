//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    // Check to see if the note is not empty
    var note: Note?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Configures the title and content textfield when creating a note
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Check if there is an existing note
        if let note = note {
            // Set the title and content of the existing note
            titleTextField.text = note.title
            contentTextView.text = note.content
        } else {
            // If there is non-existent note, then it will be set up with blank
            titleTextField.text = ""
            contentTextView.text = ""
        }
    }
    
    // Tells the app what to do when the "Save" or "Cancel" button is tapped
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Identify what was tapped
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
            
        // Update note that already exists
        case "save" where note != nil:
            note?.title = titleTextField.text ?? ""
            note?.content = contentTextView.text ?? ""
            note?.modificationTime = Date()
            
            // Sanve note and reload
            CoreDataHelper.saveNote()
            
        // Create new note if the note property is nil
        case "save" where note == nil:
            
            // Creates note object
            let note = CoreDataHelper.newNote()
            note.title = titleTextField.text ?? ""
            note.content = contentTextView.text ?? ""
            note.modificationTime = Date()
            
            // Save note and reload
            CoreDataHelper.saveNote()

        case "cancel":
            print("cancel bar button item tapped")
        default:
            print("unexpected segue identifier")
        }
    }
    
    
    
}










