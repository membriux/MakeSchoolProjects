//
//  MGPhotoHelper.swift
//  MakeStagram
//
//  Created by Memo on 7/12/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import UIKit

class MGPhotoHelper: NSObject {

    var completionHandler: ((UIImage) -> Void)?

    func presentActionSheet(from viewController: UIViewController) {
        // initialize alert controller
        let alertController = UIAlertController(title: nil, message: Message.whereQuestion, preferredStyle: . actionSheet)
        
        // Check if physical camera is available
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            // Create new UIAlertAction
            let capturePhotoAction = UIAlertAction(title: Message.takePhotoAction, style: .default, handler: {action in
                self.presentImagePickerController(with: .camera, from: viewController)
            })
            
            // Add action to the alertController
            alertController.addAction(capturePhotoAction)
        }
        
        // Same as previous steps (check library, create UIAlertAction, and add Action)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let uploadAction = UIAlertAction(title: Message.uploadFromLibrary, style: .default, handler: { action in
                self.presentImagePickerController(with: .photoLibrary, from: viewController)
            })
            
            alertController.addAction(uploadAction)
        }
        
        // Add cancel button to allow user to cancel
        let cancelAction = UIAlertAction (title: Message.cancel, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // Present UIAlertController from our UIViewController
        viewController.present(alertController, animated: true)
    }
    
    
    func presentImagePickerController(with SourceType: UIImagePickerControllerSourceType, from viewController: UIViewController) {
        // Create instance of UIImagePickerController
        let imagePickerController = UIImagePickerController()
        
        // Activate camera or photo library depending on what the user chose
        imagePickerController.sourceType = SourceType
        imagePickerController.delegate = self
        
        // Present the view controller of the camera/photo library
        viewController.present(imagePickerController, animated: true)
    }
    
}

extension MGPhotoHelper: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // Calls image picker controller and dismisses it after an image is selected
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            completionHandler?(selectedImage)
        }
        
        picker.dismiss(animated: true)
        
    }
    
    // Dismiss the image picker when clicked on cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    
}











