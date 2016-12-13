//
//  ViewController.swift
//  GEOQuiz
//
//  Created by ZIYU HUANG on 12/12/16.
//  Copyright © 2016 ZIYU HUANG. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreData



class MapViewController: UIViewController, GMSMapViewDelegate {

    
    
    
    var latitude = [Double]()
    var longitude = [Double]()
    var capitals = [String]()
    var countries = [String]()
    
    var wordlist = [String]()
    
    var markers = [GMSMarker]()
    
    var mapView:GMSMapView?
    
    var countryChosen : String!
    
    var capitalChosen :String!
    
    var randomCapitals=[String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        randomCapitals = [String]()
//        print(randomCapitals)
        
        
        addLocations()
        GMSServices.provideAPIKey("AIzaSyBRLTH01_cVHGWz7kOPieKgDgpyGteZyN4");
        let camera = GMSCameraPosition.camera(withLatitude: latitude[0], longitude: longitude[0], zoom: 2)
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.view = mapView
        
        
        
        for i in 0..<capitals.count{
            let currentLocation = CLLocationCoordinate2DMake(latitude[i], longitude[i])
            markers.append(GMSMarker(position:currentLocation))
            markers[i].title = countries[i]
//            markers[i].map = mapView
//            mapView?.delegate = self
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if markers.contains(marker){
            countryChosen = marker.title
            performSegue(withIdentifier: "gameStart", sender: marker)
            
//            print("haha")
            return true;
        }
        else{
            return false;
        }
    }
    
    func addLocations() {
        if FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first != nil {
            
            
            let fileLocation = Bundle.main.path(forResource: "input", ofType: ".txt")!
            print(fileLocation)
            
            do{
                let text = try String(contentsOfFile: fileLocation, encoding: String.Encoding.utf8)
                self.wordlist = text.components(separatedBy: "\n")
                
                for str in self.wordlist{
                    var temp = [String]()
                    
                    temp = str.components(separatedBy: "\t")

                    
                    if temp[0] != ""{
                        let endIndex = temp[2].index(temp[2].endIndex, offsetBy: -1)
                        let truncated = temp[2].substring(to: endIndex)
                        let k = temp[2][temp[2].index(before: temp[2].endIndex)]
                        var lat = Double(truncated)!
                        if  k == "S"{
                            
                            lat = -lat
                        }
                        latitude.append(lat)
                        capitals.append(temp[1])
                        countries.append(temp[0])
                    }
                
                    if temp[0] != ""{
                        let endIndex2 = temp[3].index(temp[3].endIndex, offsetBy: -1)
                        let truncated2 = temp[3].substring(to: endIndex2)
                        let k = temp[3][temp[3].index(before: temp[3].endIndex)]
                        var long = Double(truncated2)!
                        if  k == "W"{
                            
                            long = -long
                        }
                        longitude.append(long)
                    }
                    
                }
                
            }
            catch {print("file not read")}
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameStart"{
            let vc = segue.destination as! GameTableViewController
            vc.countryName = ((sender as! GMSMarker).title!)
            randomize()
            vc.list = randomCapitals
            vc.correctAnswer = capitalChosen
            randomCapitals = [String]() //here
        }
    }
    
    //get 3 random countries
    func randomize(){
        var temp = capitals
        
        if let index = countries.index(of: countryChosen){
            capitalChosen = temp[index]
            randomCapitals.append(capitalChosen)
            temp.remove(at: index)
        }
        for _ in 0..<3 {
            
            let i = getRanIndex(size: temp.count)
            randomCapitals.append(temp[i])
            temp.remove(at: i)
        }
    }
    
    func getRanIndex(size:Int)->Int{
        let ranNum = arc4random_uniform(23173)
        let num = Int(ranNum)
        let ran = num % (size)
        return ran
    }

}

