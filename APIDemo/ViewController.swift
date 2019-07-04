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
    let  city:String
    let longitude: String
}


class ViewController: UIViewController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    //outlets for final
    @IBOutlet weak var teamBFinal: UILabel!
    @IBOutlet weak var teamAFinal: UILabel!
     @IBOutlet weak var FCity: UILabel!
    @IBOutlet weak var FLocation: UILabel!
    @IBOutlet weak var FDate: UILabel!
    @IBOutlet weak var FTime: UILabel!
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
    
    // MARK: Outlets
    // for Quater-Finals
    @IBOutlet weak var QFTeamA: UILabel!
    @IBOutlet weak var QFTeamb: UILabel!
    @IBOutlet weak var QFCity: UILabel!
    @IBOutlet weak var QFLocation: UILabel!
    @IBOutlet weak var QFTeamA2: UILabel!
    @IBOutlet weak var QFTeamB2: UILabel!
    @IBOutlet weak var QFDate: UILabel!
    @IBOutlet weak var QFTime: UILabel!
    
    
    
    // for SEmi-Finals
    @IBOutlet weak var SFTeamA: UILabel!
    @IBOutlet weak var SFTeamB: UILabel!
    @IBOutlet weak var SFCity: UILabel!
    @IBOutlet weak var SFLocation: UILabel!
    @IBOutlet weak var SFDate1: UILabel!
    @IBOutlet weak var SFTeamA2: UILabel!
    @IBOutlet weak var SFTeamB2: UILabel!
    @IBOutlet weak var SFDate2: UILabel!
    @IBOutlet weak var SFTime: UILabel!
    
    
 //Third Part Team
    @IBOutlet weak var TPTeamA: UILabel!
    @IBOutlet weak var TPTeamB: UILabel!
    @IBOutlet weak var TPCity: UILabel!
    @IBOutlet weak var TPLocation: UILabel!
    @IBOutlet weak var TPDate: UILabel!
    @IBOutlet weak var TPTime: UILabel!
    
    
    
    
    
    
    // MARK: Default functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
            
            //print(apiData)
            
            
            // 2. Parse out the data you need (sunrise / sunset time)
            
            // example2 - parse an array of dictionaries
            
            // 2a. Convert the response to a JSON object
            let jsonResponse = JSON(apiData)
            
            print("this is JSon Resposne",jsonResponse)
            //For Final Match
            let finalTeamA = jsonResponse["Final"]["3"]["TeamA"].string
            let finalTeamB = jsonResponse["Final"]["3"]["TeamB"].string
             let finalDate = jsonResponse["Final"]["3"]["Date"].string
             let finalTime = jsonResponse["Final"]["3"]["Time"].string
            let finalLocation = jsonResponse["Final"]["3"]["Location"].string
            let finalCity = jsonResponse["Final"]["3"]["city"].string

            // display in a UI for Final
            self.teamAFinal.text = "\(finalTeamA!)"
            self.teamBFinal.text = "\(finalTeamB!)"
            self.FCity.text = "\(finalCity!)"
            self.FDate.text = "\(finalDate!)"
            self.FTime.text = "\(finalTime!)"
            self.FLocation.text = "\(finalLocation!)"

            //For Quater-Finals
//            let QfinalTeamA = jsonResponse["QuarterFinal"]["1"]["TeamA"].string
//            let QfinalTeamB = jsonResponse["QuarterFinal"]["1"]["TeamB"].string
//             let QfinalTeamA2 = jsonResponse["QuarterFinal"]["2"]["TeamA"].string
//             let QfinalTeamB2 = jsonResponse["QuarterFinal"]["2"]["TeamB"].string
//            let QfinalDate = jsonResponse["QuarterFinal"]["1"]["Date"].string
//            let QfinalTime = jsonResponse["QuarterFinal"]["1"]["Time"].string
//            let QfinalLocation = jsonResponse["QuarterFinal"]["1"]["Location"].string
//            let QfinalCity = jsonResponse["QuarterFinal"]["1"]["city"].string
//
//            // display in a UI for Final
//            self.QFTeamA.text = "\(QfinalTeamA!)"
//            self.QFTeamb.text = "\(QfinalTeamB!)"
//            self.QFCity.text = "\(QfinalCity!)"
//            self.QFDate.text = "\(QfinalDate!)"
//            self.QFTime.text = "\(QfinalTime!)"
//            self.QFLocation.text = "\(QfinalLocation!)"
//            self.QFTeamA2.text = "\(QfinalTeamA2!)"
//            self.QFTeamB2.text = "\(QfinalTeamB2!)"
           //For Third-Match
            let TfinalTeamA = jsonResponse["ThirdMatch"]["4"]["TeamA"].string
            let TfinalTeamB = jsonResponse["ThirdMatch"]["4"]["TeamB"].string
            let TfinalDate = jsonResponse["ThirdMatch"]["4"]["Date"].string
            let TfinalTime = jsonResponse["ThirdMatch"]["4"]["Time"].string
            let TfinalLocation = jsonResponse["ThirdMatch"]["4"]["Location"].string
            let TfinalCity = jsonResponse["ThirdMatch"]["4"]["city"].string

            // display in a UI for Final
            self.TPTeamA.text = "\(TfinalTeamA!)"
            self.TPTeamB.text = "\(TfinalTeamB!)"
            self.TPCity.text = "\(TfinalCity!)"
            self.TPDate.text = "\(TfinalDate!)"
            self.TPTime.text = "\(TfinalTime!)"
            self.TPLocation.text = "\(TfinalLocation!)"

            //For SemiFinals
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
            self.SFTeamA.text = "\(SfinalTeamA!)"
            self.SFTeamB.text = "\(SfinalTeamB!)"
            self.SFCity.text = "\(SfinalCity!)"
            self.SFDate1.text = "\(SfinalDate!)"
            self.SFTime.text = "\(SfinalTime!)"
            self.SFLocation.text = "\(SfinalLocation!)"
            self.SFTeamA2.text = "\(SfinalTeamA2!)"
            self.SFTeamB2.text = "\(SfinalTeamB2!)"
             self.SFDate2.text = "\(SfinalDate2!)"
           //  2b. Get the array out of the JSON object
     //       var responseArray = jsonResponse.arrayValue
            //For SemiFinals
            let QfinalTeamA = jsonResponse["QuarterFinal"]["8"]["TeamA"].string
            let QfinalTeamB = jsonResponse["QuarterFinal"]["8"]["TeamB"].string
            let QfinalTeamA2 = jsonResponse["QuarterFinal"]["7"]["TeamA"].string
            let QfinalTeamB2 = jsonResponse["QuarterFinal"]["7"]["TeamB"].string
            let QfinalDate = jsonResponse["QuarterFinal"]["8"]["Date"].string
            let QfinalTime = jsonResponse["QuarterFinal"]["8"]["Time"].string
            let QfinalLocation = jsonResponse["QuarterFinal"]["8"]["Location"].string
            let QfinalCity = jsonResponse["QuarterFinal"]["8"]["city"].string
            
            // display in a UI for Final
            self.QFTeamA.text = "\(QfinalTeamA!)"
            self.QFTeamb.text = "\(QfinalTeamB!)"
            self.QFCity.text = "\(QfinalCity!)"
            self.QFDate.text = "\(QfinalDate!)"
            self.QFTime.text = "\(QfinalTime!)"
            self.QFLocation.text = "\(QfinalLocation!)"
            self.QFTeamA2.text = "\(QfinalTeamA2!)"
            self.QFTeamB2.text = "\(QfinalTeamB2!)"
            
            
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
    
//    @IBAction func buttonPressed(_ sender: Any) {
//        print("button pressed")
//
//        // check if the watch is paired / accessible
//        if (WCSession.default.isReachable) {
//            // construct the message you want to send
//            // the message is in dictionary
//            let abc = [
//                "lastName":"albert",
//                "firstName":"danison",
//                "email":"a@gmail.com",
//                "lat":"50.0",
//                "lng":"97.0",
//                "username":"adanison",
//                "password":"0000"
//            ]
//            // send the message to the watch
//            WCSession.default.sendMessage(abc, replyHandler: nil)
//        }
//        else {
//            print("PHONE: Cannot find the watch")
//        }
//
//    }
//
    
}

