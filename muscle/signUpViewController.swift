//
//  signUpViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/09.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit
import Firebase





class signUpViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userEmail: UITextField!
    
    // インスタンス変数
    var DBRef:DatabaseReference!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //インスタンスを作成
        DBRef = Database.database().reference()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitBtn(_ sender: Any) {
        let data = ["name": userName.text!]
        DBRef.child("user/01").setValue(data)
    
    
    }
    
    
    

}
