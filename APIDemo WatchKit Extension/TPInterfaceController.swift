//
//  TPInterfaceController.swift
//  APIDemo WatchKit Extension
//
//  Created by jatin verma on 2019-07-03.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON

class TPInterfaceController: WKInterfaceController {

    @IBOutlet var teamAoutput: WKInterfaceLabel!
    
    
    @IBOutlet var teamBOutput: WKInterfaceLabel!
    
    @IBOutlet var locationOutput: WKInterfaceLabel!
    
    
    
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
        let TfinalTeamA = jsonResponse["ThirdMatch"]["4"]["TeamA"]
        let TfinalTeamB = jsonResponse["ThirdMatch"]["4"]["TeamB"].string
        let TfinalDate = jsonResponse["ThirdMatch"]["4"]["Date"].string
        let TfinalTime = jsonResponse["ThirdMatch"]["4"]["Time"].string
        let TfinalLocation = jsonResponse["ThirdMatch"]["4"]["Location"].string
        let TfinalCity = jsonResponse["ThirdMatch"]["4"]["city"].string
        
        // display in a UI for Final
            self.teamAoutput.setText("\(TfinalTeamA)")
            self.teamBOutput.setText("\(TfinalTeamB)")
            self.locationOutput.setText("\(TfinalLocation)")
//        self.TPTeamA.text = "\(TfinalTeamA!)"
//        self.TPTeamB.text = "\(TfinalTeamB!)"
//        self.TPCity.text = "\(TfinalCity!)"
//        self.TPDate.text = "\(TfinalDate!)"
//        self.TPTime.text = "\(TfinalTime!)"
//        self.TPLocation.text = "\(TfinalLocation!)"
        
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
