//
//  muscleMenuAddViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/05.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class muscleMenuAddViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var muscleMenuAddTable: UITableView!
    
    // 5. テーブルに表示するテキスト
    let muscleMenutexts =
        
        ["ダンベル", "ベンチプレス", "デットリフト", "ダンベルショルダープレス", "腹筋", "ダンベルカール", "ハンマーカール"]

    
    // Sectionで使用する配列を定義する.
    private let muscleMenuSections: NSArray = ["胸", "肩", "腕", "背中", "足", "腹"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 4. delegateとdataSourceを設定
        muscleMenuAddTable.delegate = self
        muscleMenuAddTable.dataSource = self
        
        // trueで複数選択、falseで単一選択
        muscleMenuAddTable.allowsMultipleSelection = true

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
//    セクションの数を返す
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return muscleMenuSections.count
    }
    
//    セクションのタイトルを返す
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return muscleMenuSections[section] as? String
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muscleMenutexts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")

        cell.textLabel?.text = muscleMenutexts[indexPath.row]
        
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

}
