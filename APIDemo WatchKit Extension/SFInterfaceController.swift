//
//  SFInterfaceController.swift
//  APIDemo WatchKit Extension
//
//  Created by jatin verma on 2019-07-03.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON

class SFInterfaceController: WKInterfaceController {

    
    @IBOutlet var teamAoutput: WKInterfaceLabel!
    
    
    @IBOutlet var teamBOutput: WKInterfaceLabel!
    
    @IBOutlet var locationOutput: WKInterfaceLabel!
    // MARK: Actions
    @IBAction func button() {
        
        
        
        
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
            let SfinalTeamA = jsonResponse["SemiFinal"]["5"]["TeamA"].string
            let SfinalTeamB = jsonResponse["SemiFinal"]["5"]["TeamB"].string
            let SfinalTeamA2 = jsonResponse["SemiFinal"]["6"]["TeamA"].string
            let SfinalTeamB2 = jsonResponse["SemiFinal"]["6"]["TeamB"].string
            let SfinalDate = jsonResponse["SemiFinal"]["5"]["Date"].string
            let SfinalDate2 = jsonResponse["SemiFinal"]["6"]["Date"].string
            let SfinalTime = jsonResponse["SemiFinal"]["5"]["Time"].string
            let SfinalLocation = jsonResponse["SemiFinal"]["5"]["Location"].string
            let SfinalCity = jsonResponse["SemiFinal"]["5"]["city"].string
            // display in a UI for Final
            print(apiData)
            self.teamAoutput.setText("\(SfinalTeamA)")
            self.locationOutput.setText("\(SfinalLocation)")
            self.teamBOutput.setText("\(SfinalTeamB)")
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
