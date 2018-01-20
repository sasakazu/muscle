//
//  logInViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2018/01/20.
//  Copyright © 2018年 笹倉 一也. All rights reserved.
//

import UIKit
import Firebase



class logInViewController: UIViewController {


    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

 
    @IBAction func loginBtn(_ sender: Any) {
       
        
        
        if self.emailTF.text == "" || self.passwordTF.text == "" {
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().signIn(withEmail: self.emailTF.text!, password: self.passwordTF.text!) { (user, error) in
                
                if error == nil {
                    
                    print("You have successfully logged in")
                    
                    
                } else {
                    
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }


}

