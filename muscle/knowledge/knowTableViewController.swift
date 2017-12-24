//
//  knowTableViewController.swift
//  
//
//  Created by 笹倉 一也 on 2017/12/21.
//




import UIKit

class knowTableViewController: UITableViewController {
    
      var selectedText: String?
    
    
    var knowSection = ["section1","section2","section3","section4","section5","section6","section7"]

    var knowTitle = ["title1","title2","title3","title4","title5","title6","title7"]

    var knowContents = ["contents1","contents2","contents3","contents4","contents5","contents6","contents7"]

 
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return knowTitle.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = knowTitle[indexPath.row]
       
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedText = knowTitle[indexPath.row]
        
        performSegue(withIdentifier: "segue", sender: self)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segue") {
            let secondVC: knowSecondViewController = (segue.destination as? knowSecondViewController)!
            
            // 11. SecondViewControllerのtextに選択した文字列を設定する
            secondVC.text = selectedText
        }
    }
 

    
    

}


