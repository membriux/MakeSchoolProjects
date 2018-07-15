//
//  LoginViewController.swift
//  MakeStagram
//
//  Created by Memo on 7/9/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase


// This Singleton (similar to global variables) allows us to share the user as a resource
typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // Access the FUIAuth default auth UI Singleton
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        // Set FUIAuth singleton delegate
        authUI.delegate = self
        
        // Present the auth view controller
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
        
    }

}

extension LoginViewController: FUIAuthDelegate {
    
    // Use Firebase Auth.User to prevent namespace conflicts
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
        // Check that FIRUser returned from authentication is not nil by unwrapping
        guard let user = user else { return }
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                User.setCurrent(user, writeToUserDefaults: true)
            
                // Change initial view controller to .main storyboard
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    
    
}




