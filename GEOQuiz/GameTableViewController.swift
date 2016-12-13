//
//  GameTableViewController.swift
//  GEOQuiz
//
//  Created by ZIYU HUANG on 12/13/16.
//  Copyright © 2016 ZIYU HUANG. All rights reserved.
//

import UIKit



class GameTableViewController: UITableViewController {
    
//    var score = Singleton.sharedInstance.getScore()

    var countryName = String()
    
    var list = [String]()
    
    var correctAnswer : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = countryName
//        print(list)
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
        if list[indexPath.row] == correctAnswer!{
            print("You are correct!")
            Singleton.sharedInstance.increment()
            let score = Singleton.sharedInstance.getScore()
            print(score)
            let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
            selectedCell.contentView.backgroundColor = UIColor.green
        }
    }
}
