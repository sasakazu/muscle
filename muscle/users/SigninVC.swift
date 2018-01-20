//
//  SigninVC.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/16.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class SignInVC: UIViewController , GIDSignInUIDelegate{
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
    
    
    
    @IBAction func onSignInTapped(_ sender: Any) {
        guard let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
        else {
            AlertController.showAlert(self, title: "MISSING INFO", message: "Please fill out all required fields")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else {
                return
            }
            
            print(user.email ?? "MISSING EMAIL")
            print(user.displayName ?? "MISSING DISPLAYNAME")
            print(user.uid)
            
            self.performSegue(withIdentifier: "signInSegue", sender: nil)
        }
    }
    
    
    
    
    
    
    
}
