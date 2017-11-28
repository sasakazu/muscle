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
 
    var selectedText: String?

    // Sectionで使用する配列を定義する.
    private let mySections: NSArray = ["筋肉について", "フォームについて"]
    


    // Tableで使用する配列を定義する.
    private let muscleItems: NSArray = ["筋肉が大きくなるし組み\n筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み筋肉が大きくなるし組み", "超回復とは？", "筋肉の部位について", "muscle4", "muscle5"]
    
    private let formItems: NSArray = ["ベンチプレス", "ダンベル", "デットリフト", "プルダウン"]


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
         
            print(muscleItems[indexPath.row])
            
            // 8. SecondViewControllerに渡す文字列をセット
            selectedText = muscleItems[indexPath.row] as! String
            
            // 8. SecondViewControllerへ遷移するSegueを呼び出す
            performSegue(withIdentifier: "showSecondView",sender: nil)

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
    
    // Segueで遷移時の処理
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showSecondView") {
            let secondVC: SecondViewController = (segue.destination as? SecondViewController)!
            
            // 11. SecondViewControllerのtextに選択した文字列を設定する
            secondVC.text = selectedText
        }
    }
    
    
}



