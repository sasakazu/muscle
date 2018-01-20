//
//  signUpViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2018/01/20.
//  Copyright © 2018年 笹倉 一也. All rights reserved.
//

import UIKit
import Firebase

class signUpViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet var confirmationTF: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signupBtn(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) { (user, error) in
        
        }
  
        
   }
    

}

