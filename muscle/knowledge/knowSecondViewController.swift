//
//  knowSecondViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/21.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class knowSecondViewController: UIViewController {
    
    
    var myString = String()
    
    @IBOutlet weak var knowTitleLabel: UILabel!
    @IBOutlet weak var knowContentsLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        knowTitleLabel.text = myString
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
