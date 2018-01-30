//
//  musclemenuAddViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2018/01/30.
//  Copyright © 2018年 笹倉 一也. All rights reserved.
//

import UIKit

class musclemenuAddViewController: UIViewController {
    
  

    
    @IBOutlet weak var musclemenuTextField: UITextField!
    @IBOutlet weak var musclemenuTableView: UITableView!
    @IBOutlet weak var musclemenuAddBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func musclemenuAddTapped(_ sender: Any) {
    }
    
    @IBAction func musclemenuOtherMenuTapped(_ sender: Any) {
        
        var alert = UIAlertController(title: "メニューを追加", message: "好きなメニューを追加できます。", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Add", style: .default) { (action:UIAlertAction!) -> Void in
            
            // 入力したテキストをコンソールに表示
            let textField = alert.textFields![0] as UITextField
            print(textField.text)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action:UIAlertAction!) -> Void in
        }
        
        // UIAlertControllerにtextFieldを追加
        alert.addTextField { (textField:UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    
    }
    
    
    
    
}
