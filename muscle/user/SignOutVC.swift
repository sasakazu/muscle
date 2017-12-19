//
//  SignOutVC.swift
//  
//
//  Created by 笹倉 一也 on 2017/12/16.
//

import UIKit
import  Firebase

class SignOutVC: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let username = Auth.auth().currentUser?.displayName else { return }
        
        label.text = "Name: \(username)"
    }
    
    
    
    @IBAction func onSignOutTapped(_ sender: Any) {
    
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOutSegue", sender: nil)
        } catch {
            print(error)
        }
    
    }
    
    
    
    
    
    
    
}
