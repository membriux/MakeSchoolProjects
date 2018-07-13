//
//  UserService.swift
//  MakeStagram
//
//  Created by Memo on 7/11/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase


struct UserService {

    static func show(forUID uid: String, completion: @escaping (User?) -> Void) {
        
        // Construct a relative path to the reference of the user's information in our database
        let ref = Database.database().reference().child("users").child(uid)
        
        // Read from the path we created and pass an event closure to handle data
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let user = User(snapshot: snapshot) else {
                return completion(nil)
            }
            
            completion(user)
        })
    }
    
    static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void) {
        
        // Create dictionary to store the username that the user provided
        let userAttrs = ["username": username]
        
        // Specify a relative path for the location of where to store the data
        let ref = Database.database().reference().child("users").child(firUser.uid)
        
        
        // Write the data we want to store at that location
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            
            // Read the user we just wrote to the database and create a user from the snapshot
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                completion(user)
            })
        }
    }
    
    
    
}









