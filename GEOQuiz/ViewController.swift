//
//  ViewController.swift
//  GEOQuiz
//
//  Created by ZIYU HUANG on 12/13/16.
//  Copyright © 2016 ZIYU HUANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = Singleton.sharedInstance.getScore()

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        scoreLabel.text = String(score)
        navigationItem.title = "Pick a location"
    }

    
    override func viewWillAppear(_ animated: Bool) {
        score = Singleton.sharedInstance.getScore()
        scoreLabel.text = String(score)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
    
    
}
