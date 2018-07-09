//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {
    
    // Where notes are stored and the UI reloads the data
    var notes = [Note]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // Load screen
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notes = CoreDataHelper.retrieveNotes()
    }
    
    // When cancel is pressed, we update the notes array
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        notes = CoreDataHelper.retrieveNotes() // Makes sure our table view data is always synced
    }
    
    // Check for what was tapped ("Add note" button or viewing a note)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Check if segue has identifier
        guard let identifier = segue.identifier else {return}
        
        
        switch identifier {
        // Displays note that already exists
        case "displayNote":
            // Retrieve index of note selected
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            // Retrive selected note using the index path
            let note  = notes[indexPath.row]
            
            // Get properties of the note to cast it on the DisplayNoteViewController
            let destination = segue.destination as! DisplayNoteViewController
            
            // Set the note that will be displayed by the DisplayNoteViewController
            destination.note = note
            
            
        // When the "+" button is tapped
        case "addnote":
            print("create note bar button tapped")
        default:
            print("unexpected segue identifier")
        }
        
        // If so, check if identifier is equal to displayNote
        if identifier == "displayNote" {
            print("Transitioning to the Display Note View Controller")
        }
        
    }
    
    // How many sections/cells to show
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count // Number of rows obtained by number of notes
    }
    
    // Deleting objects/cells from table
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let noteToDelete = notes[indexPath.row] // Retrieve note
            CoreDataHelper.deleteNote(note: noteToDelete) // Delete note
            
            notes = CoreDataHelper.retrieveNotes() // Refresh notes
        }
    }
    
    // Configures cells of the table to show their pertaining title and content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Identifies each cell according to their index
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        
        // Select cell and configure the title and date to display
        let note = notes[indexPath.row]
        
        cell.noteTitleLabel.text = note.title // Fill in the Title
        
        // Fill in the date
        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString() ?? "unknown modification time"
        
        return cell
    }
    
}
