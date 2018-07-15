//
//  StorageService.swift
//  MakeStagram
//
//  Created by Memo on 7/13/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import UIKit
import FirebaseStorage


struct StorageService {
    
    // Provide method for uploading images
    static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
        // Change the image from UIImage to Data and reduce the quality
        guard let imageData = UIImageJPEGRepresentation(image, 0.1) else {
            return completion(nil)
        }
        
        // Upload media data to path provided
        reference.putData(imageData, metadata: nil, completion: { (metadata, error) in
            // After upload, check if there was an error
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            // Call downloadURL to get URL reference and return it to the completion handler
            reference.downloadURL(completion: { (url, error) in
                if let error = error {
                    assertionFailure(error.localizedDescription)
                    return completion(nil)
                }
                completion(url)
            })
        })
    }

    
}

