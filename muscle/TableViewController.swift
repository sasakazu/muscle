//
//  tableViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/11/21.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class tableViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    // 7. SecondViewに渡す文字列
    var selectedText: String?
    
    let knowledgeBig = [ "筋肉について", "フォームについて", "トレーニングについて" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return knowledgeBig.count
    }
    
    
    
    
    /// セルに値を設定するデータソースメソッド（必須）
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = knowledgeBig[indexPath.row]
        
        return cell
    }
    
    
    
    
    /// セルが選択された時に呼ばれるデリゲートメソッド
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        // 8. SecondViewControllerに渡す文字列をセット
        selectedText = knowledgeBig[indexPath.row]
        
        // 8. SecondViewControllerへ遷移するSegueを呼び出す
        performSegue(withIdentifier: "showSecondView",sender: nil)
        
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



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

