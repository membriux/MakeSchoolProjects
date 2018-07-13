//
//  CreateUsernameViewController.swift
//  MakeStagram
//
//  Created by Memo on 7/10/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 6
    }
    
    // Create user in database
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        // Check that the user is logged in and that the user provided a username in text field
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { return }
        
        // Create username using service class
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {
                /// handle error
                return
            }
            
            User.setCurrent(user, writeToUserDefaults: true)
            
            // Create instance of main storyboard
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
            
    }
    
}











