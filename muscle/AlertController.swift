//
//  AlertController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/16.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit


class AlertController {
    
    static func showAlert(_ inViewController: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK!", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
}
