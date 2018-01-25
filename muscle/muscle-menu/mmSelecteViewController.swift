//
//  mmSelecteViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/30.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class mmSelecteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // ここで受け取る
    var sendText:String = ""
    
    @IBOutlet weak var mmNameTitle: UILabel!
    
    //    セクション
    let mmSection = ["胸", "腕", "背中"]

    //    胸
    let mmItemBreast = ["ベンチプレス", "インクライン"]
    
    //    腕
    let mmItemArm = ["ダンベル", "ダンベルカール"]
    
    //    背中
    let mmItemBack = ["チェスと", "手ェ酢と"]
    
    //    足
    let mmItemFoot = ["デットリフト", "デット"]
    
    
    @IBOutlet weak var mmSelecteTableview: UITableView!
    @IBOutlet weak var mmTitle: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // trueで複数選択、falseで単一選択
        mmSelecteTableview.allowsMultipleSelection = true
        
         mmNameTitle.text = sendText
        

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mmSection.count
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mmSection[section]
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return mmItemBreast.count
        }
        else if section == 1 {
            return mmItemBack.count
        }
        else if section == 2 {
            return mmItemBack.count
        }
            
        
        else if section == 3 {
            return mmItemFoot.count
        }
            
        else{
            return 0
        }
        
    
     
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mmSelecteCell", for: indexPath)
   
        if indexPath.section == 0 {
            
            cell.textLabel?.text = "\(mmItemBreast[indexPath.row])"
            
        } else if indexPath.section == 1 {
            
            cell.textLabel?.text = "\(mmItemArm[indexPath.row])"
            
        }
        
        else if indexPath.section == 2 {
            
            cell.textLabel?.text = "\(mmItemBack[indexPath.row])"
            
        }
        
        else if indexPath.section == 3 {
            
            cell.textLabel?.text = "\(mmItemFoot[indexPath.row])"
            
        }

        return cell
    
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        cell?.accessoryType = .checkmark
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        cell?.accessoryType = .none
    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    
    }

    
    
    @IBAction func mmOkBtn(_ sender: Any) {
    }
    
    
    
    
    
}
