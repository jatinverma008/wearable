//
//  QFInterfaceController.swift
//  APIDemo WatchKit Extension
//
//  Created by jatin verma on 2019-07-03.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON

class QFInterfaceController: WKInterfaceController {

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
                let QfinalTeamA = jsonResponse["QuarterFinal"]["8"]["TeamA"].string
                let QfinalTeamB = jsonResponse["QuarterFinal"]["8"]["TeamB"].string
                let QfinalTeamA2 = jsonResponse["QuarterFinal"]["7"]["TeamA"].string
                let QfinalTeamB2 = jsonResponse["QuarterFinal"]["7"]["TeamB"].string
                let QfinalDate = jsonResponse["QuarterFinal"]["8"]["Date"].string
                let QfinalTime = jsonResponse["QuarterFinal"]["8"]["Time"].string
                let QfinalLocation = jsonResponse["QuarterFinal"]["8"]["Location"].string
                let QfinalCity = jsonResponse["QuarterFinal"]["8"]["city"].string
                
//                // display in a UI for Final
//                self.QFTeamA.text = "\(QfinalTeamA!)"
//                self.QFTeamb.text = "\(QfinalTeamB!)"
//                self.QFCity.text = "\(QfinalCity!)"
//                self.QFDate.text = "\(QfinalDate!)"
//                self.QFTime.text = "\(QfinalTime!)"
//                self.QFLocation.text = "\(QfinalLocation!)"
//                self.QFTeamA2.text = "\(QfinalTeamA2!)"
//                self.QFTeamB2.text = "\(QfinalTeamB2!)"
                
                // display in a UI for Final
                print(apiData)
                self.teamAoutput.setText("\(QfinalTeamA)")
                self.locationOutput.setText("\(QfinalLocation)")
                self.teamBOutput.setText("\(QfinalTeamB)")
                //self.watchOutputLabel.setText("\(finalTeamA)")
                
                //            self.FCity.text = "\(finalCity!)"
                //            self.FDate.text = "\(finalDate!)"
                //            self.FTime.text = "\(finalTime!)"
                //            self.FLocation.text = "\(finalLocation!)"
                
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
