//
//  mmMainViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/30.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class mmMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var test = [ "test1", "test2", "test3", "test4"]

    
    @IBOutlet weak var mmMainTableView: UITableView!
    @IBOutlet weak var mmMainEditBtn: UIBarButtonItem!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mmMainCell", for: indexPath)        
        cell.textLabel?.text = test[indexPath.row]
        
        return cell
    }
    

      //  delete スワイプ

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            test.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


    //move cell functions
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let mmMainitem = test[sourceIndexPath.row]
        test.remove(at: sourceIndexPath.row)
        test.insert(mmMainitem, at: destinationIndexPath.row)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    
    @IBAction func mmMainEdtitActionBtn(_ sender: Any) {
        mmMainTableView.isEditing = !mmMainTableView.isEditing
            
        switch mmMainTableView.isEditing {
        
            case true:
                mmMainEditBtn.title = "Done"
            case false:
                mmMainEditBtn.title = "Edit"
        }
        
    }
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
