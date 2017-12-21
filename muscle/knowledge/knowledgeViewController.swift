//
//  knowledgeViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/11/25.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class knowledgeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var konwledgeTableView: UITableView!
    

    // Sectionで使用する配列を定義する.
    private let mySections: NSArray = ["筋肉について", "フォームについて"]
    
    //    タイトル
    private let knowledgeTitle: NSArray = ["筋肉が大きくなる仕組み", "超回復とは？", "筋肉の部位について", "muscle4", "muscle5"]
    
    // Tableで使用する配列を定義する.
    private let knowledgeContents: NSArray = ["筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み", "超回復とは？超回復とは？超回復とは？", "筋肉の部位について筋肉の部位について筋肉の部位について筋肉の部位について", "muscle4muscle4muscle4muscle4", "muscle5muscle5muscle5muscle5muscle5muscle5muscle5muscle5muscle5"]
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return knowledgeTitle.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = knowledgeTitle[indexPath.row] as! String
        
        return cell
    }
    
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
}



