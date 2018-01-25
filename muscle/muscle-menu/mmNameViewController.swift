//
//  mmNameViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/30.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class mmNameViewController: UIViewController {

    
    @IBOutlet weak var mmNameField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func nextTappedBtn(_ sender: Any) {
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mmTitleSend" {
            let mmSelecteViewController:mmSelecteViewController = segue.destination as! mmSelecteViewController
            mmSelecteViewController.sendText = self.mmNameField.text! as String!
        }
    }
    
    
    
}
