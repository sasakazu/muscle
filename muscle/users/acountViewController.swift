//
//  acountViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2018/01/23.
//  Copyright © 2018年 笹倉 一也. All rights reserved.
//

import UIKit
import Firebase

class acountViewController: UIViewController {

    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

            let email = Auth.auth().currentUser!.email
            emailLabel.text = email
        
    }
    
    

    
    @IBAction func logoutTapped(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
    }
    
 

}
