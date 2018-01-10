//
//  timeLineViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/07.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class timeLineViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
  
    
    let timeLineTitle = [ "titletest1", "titletest2", "titletest3", "titletest4", "titletest5" ]

    let timelineImg = [ "img1", "img2", "img3", "img4"]
  
    @IBOutlet weak var timelineTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timelineTableView.delegate = self
        timelineTableView.dataSource = self

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeLineTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeLineCell", for: indexPath)
        
        
        // Tag番号 2 で UILabel インスタンスの生成
        let label2 = cell.viewWithTag(2) as! UILabel
        label2.text = String(describing: timeLineTitle[indexPath.row])
        
        return cell
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
 
    
    
    
    

}
