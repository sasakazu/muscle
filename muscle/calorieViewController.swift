//
//  calorieViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/07.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit

class calorieViewController: UIViewController {

    
    @IBOutlet weak var calorieName: UITextField!
    @IBOutlet weak var calorieNumber: UITextField!
    
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodNumber: UILabel!
    
    
    @IBOutlet weak var calorieResult: UILabel!
    
    
    
    @IBAction func resultButton(_ sender: UIButton) {
        
        let x1 = Int(calorieNumber.text!)
        let x2 = Int(calorieResult.text!)
        
        let y = x1! + x2!
        
        calorieResult.text = String(y)
        
        // textFieldの値を取得する
        let inputText = calorieName.text
        
        let inputNumber = calorieNumber.text
        // 取得した値をLabel上に表示する
        foodName.text = inputText
        
        foodNumber.text = inputNumber
        
        // 次の入力の為にtextFieldをクリアする
        calorieName.text = nil
        calorieNumber.text = nil

            
        calorieNumber.endEditing(true)
        

    }

    
    @IBAction func resetButton(_ sender: Any) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
