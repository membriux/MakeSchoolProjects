//
//  User.swift
//  MakeStagram
//
//  Created by Memo on 7/10/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User: Codable {
    
    // Singleton user variable to hold user. Private so that it can't be accessed outside of class
    private static var _current: User?
    
    // Create computed variable that only has a getter that can access the private variable
    static var current: User {
        
        // Check that the _current is of type User? isn't nil.
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        
        return currentUser // If not nil, user is returned
    }
    
    let uid: String
    let username: String
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    // Failable initializer
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
    }
    
    // Create a custom setter method to set the current user
    static func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        // Check if true. If true, writeToUserDefaults
        if writeToUserDefaults {
            // User JSONEncoder to turn user obtject into Data
            if let data = try? JSONEncoder().encode(user) {
                // Store data for our current user with the correct key
                UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
            }
        }
        
        _current  = user
        
    }
    
    
}
