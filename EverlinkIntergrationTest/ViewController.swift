//
//  ViewController.swift
//  EverlinkIntergrationTest
//
//  Created by Nathan Kuruvilla on 22/11/2024.
//

import UIKit
import EverlinkBroadcastSDK

class ViewController: UIViewController, EverlinkEventDelegate {
    
    let everlink = Everlink(appID: "FlutterTestiOS")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set delegate
        everlink.delegate = self
        
    }
    
    func onAudiocodeReceived(token: String) {
        print("Audiocode received: \(token)") //send the token to Dart code, triggering a detection event
    }

    func onMyTokenGenerated(token: String, oldToken: String) { //send the tokens to Dart code
        print("New token: \(token)")
        print("Old token: \(oldToken)")
    }
    
    func everlinkFunctions() { // allow these functions to be called from the Dart code
        
        //to adjust volume:
        everlink.playVolume(volume: 0.9, loudspeaker: true)
        
        //to create token:
        everlink.createNewToken(startDate: "")
        
        //to save an array:
        let array = ["", ""] //pass the array from the Dart code
         everlink.saveSounds(tokensArray: array)
        
        
        //to clear saved tokens
        everlink.clearSounds()
        
        // to start detecting
        do {
            try everlink.startDetecting()
        } catch {
            //return error to Dart code
            print("Error starting emitting: \(error)")
        }
        
       //to start emitting
        do {
            try everlink.startEmitting()
        } catch {
            //return error to Dart code
            print("Error starting emitting: \(error)")
        }
        
        //to start emitting a particular token
         do {
             try everlink.startEmittingToken(token: "") //pass the token from the Dart code
         } catch {
             //return error to Dart code
             print("Error starting emitting: \(error)")
         }
        
        //to stop emitting
        everlink.stopEmitting()
        
    }


}

