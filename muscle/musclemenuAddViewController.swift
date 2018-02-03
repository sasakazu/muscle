//
//  musclemenuAddViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2018/01/30.
//  Copyright © 2018年 笹倉 一也. All rights reserved.
//

import UIKit

class musclemenuAddViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    var musclemenuItem = [ "ダンベル", "ベンチプレス", "デットリフト" ]
    
    
    @IBOutlet weak var musclemenuTextField: UITextField!
    @IBOutlet weak var musclemenuTableView: UITableView!
    @IBOutlet weak var musclemenuAddBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musclemenuTableView.allowsMultipleSelection = true

    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func musclemenuAddTapped(_ sender: Any) {
    }
    
    @IBAction func musclemenuOtherMenuTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "メニューを追加", message: "好きなメニューを追加できます。", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Add", style: .default) { (action:UIAlertAction!) -> Void in
            
            // 入力したテキストをコンソールに表示
            let textField = alert.textFields![0] as UITextField
            print(textField.text!)
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
    
    //    テーブルファンクション
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musclemenuItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "masclemenuAddCell", for: indexPath)
        
         cell.textLabel?.text = musclemenuItem[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        // チェックマークを入れる
        cell?.accessoryType = .checkmark
    }
    
    
    // セルの選択が外れた時に呼び出される
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        // チェックマークを外す
        cell?.accessoryType = .none
    }
    
    //    テーブルファンクション
    
    
    
}

//end
