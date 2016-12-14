//
//  GameTableViewController.swift
//  GEOQuiz
//
//  Created by ZIYU HUANG on 12/13/16.
//  Copyright © 2016 ZIYU HUANG. All rights reserved.
//

import UIKit



class GameTableViewController: UITableViewController {
    

    var countryName = String()
    
    var list = [String]()
    
    var correctAnswer : String?
    
    var getPoint = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = countryName
        Singleton.sharedInstance.setFalse()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let choices = cell.viewWithTag(1) as! UILabel
        choices.text = list[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        if list[indexPath.row] == correctAnswer!{
            if getPoint == false{
               Singleton.sharedInstance.increment()
                Singleton.sharedInstance.setTrue()
                getPoint = true
            }
            selectedCell.contentView.backgroundColor = UIColor.green
        }else{
            selectedCell.contentView.backgroundColor = UIColor.red
        }
    }
    
    
}
