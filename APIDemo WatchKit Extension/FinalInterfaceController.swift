//
//  InterfaceController.swift
//  APIDemo WatchKit Extension
//
//  Created by Parrot on 2019-03-03.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON
import WatchConnectivity

class FinalInterfaceController: WKInterfaceController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
    // MARK: Outlet
    // ---------------
    
   
    @IBOutlet var teamAoutput: WKInterfaceLabel!
    
   
     @IBOutlet var teamBOutput: WKInterfaceLabel!
    
    @IBOutlet var locationOutput: WKInterfaceLabel!
    // MARK: Actions
    @IBAction func getDataPressed() {
        print("Watch button pressed")
        // TODO: Put your API call here
        //let URL = "https://httpbin.org/get"
        //let URL = "https://jsonplaceholder.typicode.com/posts"
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
            
            // example1 - parse a dictionary
            
            // 2a. Convert the response to a JSON object
            let jsonResponse = JSON(apiData)
            
            // 2b. Get a key from the JSON object
            let finalTeamA = jsonResponse["Final"]["3"]["TeamA"]
            let finalTeamB = jsonResponse["Final"]["3"]["TeamB"]
            let finalDate = jsonResponse["Final"]["3"]["Date"].string
            let finalTime = jsonResponse["Final"]["3"]["Time"].string
            let finalLocation = jsonResponse["Final"]["3"]["Location"]
            let finalCity = jsonResponse["Final"]["3"]["city"].string
            
            // display in a UI for Final
             print(apiData)
            self.teamAoutput.setText("\(finalTeamA)")
            self.locationOutput.setText("\(finalLocation)")
             self.teamBOutput.setText("\(finalTeamB)")
            //self.watchOutputLabel.setText("\(finalTeamA)")
           

        }
    }
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
