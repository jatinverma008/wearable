//
//  ViewController.swift
//  APIDemo
//
//  Created by Parrot on 2019-03-03.
//  Copyright © 2019 Parrot. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import WatchConnectivity

struct jsonstruct:Decodable {
    
    let Date:String
    let Id:String
    let Latitude:String
    let Location:String
    let TeamA:String
    let TeamB:String
    let Time:String
    let city:String
    let longitude: String
}


class ViewController: UIViewController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
    
    // MARK: Outlets
    @IBOutlet weak var outputLabel: UILabel!
    
    var arrdata = [jsonstruct]()
    

    // MARK: Default functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
           getdata()
    }
         func getdata(){
        //let URL = "https://httpbin.org/get"
        let URL = "https://assignment-f016d.firebaseio.com/Matches.json"
        
        Alamofire.request(URL).responseJSON {
            
            response in
            
            // TODO: Put your code in here
            // ------------------------------------------
            // 1. Convert the API response to a JSON object
            
            // -- check for errors
            let apiData = response.result.value
            if (apiData == nil) {
                print("Error when getting API data")
                return
            }
            // -- if no errors, then keep going
            
            print(apiData)
            
            
            // 2. Parse out the data you need (sunrise / sunset time)
            
            // example2 - parse an array of dictionaries
            
            // 2a. Convert the response to a JSON object
            let jsonResponse = JSON(apiData)
            
            print(jsonResponse)
            
            // 2b. Get the array out of the JSON object
            var responseArray = jsonResponse.arrayValue
            
            
            
            
            
        }
        
        
        // Does your iPhone support "talking to a watch"?
        // If yes, then create the session
        // If no, then output error message
        if (WCSession.isSupported()) {
            print("PHONE: Phone supports WatchConnectivity!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else {
            print("PHONE: Phone does not support WatchConnectivity")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("button pressed")
        
        // check if the watch is paired / accessible
        if (WCSession.default.isReachable) {
            // construct the message you want to send
            // the message is in dictionary
            let abc = [
                "lastName":"albert",
                "firstName":"danison",
                "email":"a@gmail.com",
                "lat":"50.0",
                "lng":"97.0",
                "username":"adanison",
                "password":"0000"
            ]
            // send the message to the watch
            WCSession.default.sendMessage(abc, replyHandler: nil)
        }
        else {
            print("PHONE: Cannot find the watch")
        }
        
    }
    
    
}

