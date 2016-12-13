//
//  SingletonModel.swift
//  GEOQuiz
//
//  Created by ZIYU HUANG on 12/13/16.
//  Copyright © 2016 ZIYU HUANG. All rights reserved.
//

import Foundation
class Singleton {
    static let sharedInstance = Singleton()
    
    var score = 0
    
    public func increment(){
        score += 1
    }
    
    public func getScore() -> Int{
        return score
    }
}