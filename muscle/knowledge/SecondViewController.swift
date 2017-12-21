//
//  SecondViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/11/22.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var klTitle: UILabel!
    @IBOutlet weak var klContentsLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        knowledgeTitleLabel.text = knowledgeTitle[myIndex]
        klContentsLabel.text = knowledgeContents
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  

}
