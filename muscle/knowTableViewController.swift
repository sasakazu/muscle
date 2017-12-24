//
//  knowTableViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/24.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

var knowTitle = [ "筋トレとは？","超回復とは？","筋トレのメリットとは？" ]
var knowDesc = [ "筋トレとはなんでしょうか？筋トレとはなんでしょうか？筋トレとはなんでしょうか？筋トレとはなんでしょうか？筋トレとはなんでしょうか？筋トレとはなんでしょうか？",
                 "超回復とは超回復とは超回復とは超回復とは超回復とは超回復とは超回復とは超回復とは超回復とは超回復とは超回復とは超回復とは",
                 "筋トレのメリットとは？筋トレのメリットとは？筋トレのメリットとは？筋トレのメリットとは？筋トレのメリットとは？筋トレのメリットとは？筋トレのメリットとは？筋トレのメリットとは？筋トレのメリットとは？筋トレのメリットとは？" ]


var myIndex = 0

class knowTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return knowTitle.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = knowTitle[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        
        performSegue(withIdentifier: "segue", sender: self)
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
