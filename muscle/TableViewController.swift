//
//  tableViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/11/21.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class tableViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    //  SecondViewに渡す文字列
    var selectedText: String?
    
//    let knowledgeBig = [ "筋肉について", "フォームについて", "トレーニングについて" ]
    
    // Tableで使用する配列を定義する.
    private let myiPhoneItems: NSArray = ["iOS9","iOS8", "iOS7", "iOS6", "iOS5", "iOS4"]
    private let myAndroidItems: NSArray = ["5.x", "4.x", "2.x", "1.x"]
    
    
    // Sectionで使用する配列を定義する.
    private let mySections: NSArray = ["iPhone", "Android"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Cell名の登録をおこなう.
        UITableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定をする.
        UITableView.dataSource = self
        
        // Delegateを設定する.
        UITableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    セクションの数を返す
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
    
//    セクションのタイトルを返す
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("Value: \(myiPhoneItems[indexPath.row])")
        } else if indexPath.section == 1 {
            print("Value: \(myAndroidItems[indexPath.row])")
        }
    }
    
    /*
     テーブルに表示する配列の総数を返す.
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myiPhoneItems.count
        } else if section == 1 {
            return myAndroidItems.count
        } else {
            return 0
        }
    }
    
    
    
    
    /// セルの個数を指定するデリゲートメソッド（必須）
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return knowledgeBig.count
//    }
    
    
    
    
    /// セルに値を設定するデータソースメソッド（必須）
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(myiPhoneItems[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(myAndroidItems[indexPath.row])"
        }
        
        return cell
    }
    
    
//
//    /// セルが選択された時に呼ばれるデリゲートメソッド
//    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
//        // 8. SecondViewControllerに渡す文字列をセット
//        selectedText = knowledgeBig[indexPath.row]
//
//        // 8. SecondViewControllerへ遷移するSegueを呼び出す
//        performSegue(withIdentifier: "showSecondView",sender: nil)
//
//    }
    
    
    // Segueで遷移時の処理
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showSecondView") {
            let secondVC: SecondViewController = (segue.destination as? SecondViewController)!
            
            // 11. SecondViewControllerのtextに選択した文字列を設定する
            secondVC.text = selectedText
        }
    }
    
}



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

