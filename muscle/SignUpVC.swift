//
//  SignUpVC.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/16.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit
import Firebase



class SignUpVC: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        
        guard let username = usernameTF.text,
        username != "",
        let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
            
            else {
                AlertController.showAlert(self, title: "Missing Info", message: "Please fill out all fields")
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else {
                return
            }
            print(user.email ?? "MISSING EMAIL")
            print(user.uid)
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else {
                    AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                
            })
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
