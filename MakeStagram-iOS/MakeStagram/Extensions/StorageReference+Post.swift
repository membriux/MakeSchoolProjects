//
//  StorageReference+Post.swift
//  MakeStagram
//
//  Created by Memo on 7/14/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import Foundation
import FirebaseStorage

extension StorageReference {
    static let dateFormatter = ISO8601DateFormatter()
    
    // Generate new location for each new post image that is created by the current ISO timestamp
    static func newPostImageReference() -> StorageReference {
        let uid = User.current.uid
        let timestamp = dateFormatter.string(from: Date())
        
        return Storage.storage().reference().child("images/posts/\(uid)/\(timestamp).jpg")
    }
    
    
}
