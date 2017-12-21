//
//  knowledgeTableViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/21.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

// Section
var mySections: NSArray = ["筋肉について", "フォームについて"]

//    タイトル
var knowledgeTitle: NSArray = ["筋肉が大きくなる仕組み", "超回復とは？", "筋肉の部位について", "muscle4", "muscle5"]

// Tableで使用する配列を定義する.
var knowledgeContents: NSArray = [
    
    "筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み",
    "超回復とは？超回復とは？超回復とは？",
    "筋肉の部位について筋肉の部位について筋肉の部位について筋肉の部位について",
    "muscle4muscle4muscle4muscle4",
    "muscle5muscle5muscle5muscle5muscle5muscle5muscle5muscle5muscle5"
    
]



class knowledgeTableViewController: UITableViewController {
    
    

    
    
    var myIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }




    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
         return knowledgeTitle.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = knowledgeTitle[indexPath.row] as? String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
        
        selectedklTitle = UILabel(named: knowledgeTitle[indexPath.row] as! String)
        if selectedklTitle != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegue(withIdentifier: "segue",sender: nil)
    }
    

   
}
