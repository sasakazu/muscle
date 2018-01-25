//
//  mmMainViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/30.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class mmMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    // ここで受け取る
    var mmMenu:Array = [""]
    
    @IBOutlet weak var mmMainTableView: UITableView!
    @IBOutlet weak var mmMainEditBtn: UIBarButtonItem!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mmMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mmMainCell", for: indexPath)        
        cell.textLabel?.text = mmMenu[indexPath.row] 
        
        return cell
    }
    

      //  delete スワイプ

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mmMenu.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


    //move cell functions
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let mmMainitem = mmMenu[sourceIndexPath.row]
        mmMenu.remove(at: sourceIndexPath.row)
        mmMenu.insert(mmMainitem, at: destinationIndexPath.row)
        
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
    }
    

}
