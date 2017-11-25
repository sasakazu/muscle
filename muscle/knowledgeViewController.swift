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
    

    // Sectionで使用する配列を定義する.
    private let mySections: NSArray = ["筋肉について", "フォームについて"]
    


    // Tableで使用する配列を定義する.
    private let muscleItems: NSArray = ["muscle1", "muscle2", "muscle3", "muscle4", "muscle5"]
    
    private let formItems: NSArray = ["form1", "form2", "form3", "form14"]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Status Barの高さを取得を.する.
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height

        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        // TableViewの生成( status barの高さ分ずらして表示 ).
        let myTableView: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))

        // Cell名の登録をおこなう.
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
        
//        // Viewに追加する.
        self.view.addSubview(myTableView)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

        /*
         セクションの数を返す.
         */
    
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return mySections.count
        }
        
        
        /*
         セクションのタイトルを返す.
         */
    
    
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return mySections[section] as? String
        }
    
    
    
        /*
         Cellが選択された際に呼び出される.
         */
    
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.section == 0 {
                print("Value: \(muscleItems[indexPath.row])")
            } else if indexPath.section == 1 {
                print("Value: \(formItems[indexPath.row])")
            }
        }
    
    
        /*
         テーブルに表示する配列の総数を返す.
         */
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0 {
                return muscleItems.count
            } else if section == 1 {
                return formItems.count
            } else {
                return 0
            }
        }
        
        /*
         Cellに値を設定する.
         */
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
            
            if indexPath.section == 0 {
                cell.textLabel?.text = "\(muscleItems[indexPath.row])"
            } else if indexPath.section == 1 {
                cell.textLabel?.text = "\(formItems[indexPath.row])"
            }
            
            return cell
        }
}



