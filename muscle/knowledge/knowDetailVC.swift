//
//  knowDetailVC.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/24.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class knowDetailVC: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
 
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = knowTitle[myIndex]
        descLabel.text = knowDesc[myIndex]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

  

}
