//
//  ViewController.swift
//  secureNote
//
//  Created by Miguel Berrocal Gómez on 04/02/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var context = LAContext()

    @IBAction func WorthyButtonTapped(sender: AnyObject) {
        
        if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error:nil) {
            
            context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Posa el dit si creus que ho mereixes",
                reply: { (success : Bool, error : NSError? ) -> Void in
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        if success {
                            print("SI QUE HO ETS, ENDAVANT")
                        }
                        
                        if error != nil {
                            
                            var message : String
                            var showAlert : Bool
                            
                            
                            switch(error!.code) {
                            case LAError.AuthenticationFailed.rawValue:
                                message = "No ets digne"
                                showAlert = true
                                break;
                            case LAError.UserCancel.rawValue:
                                message = "Donar-li al cancel no val"
                                showAlert = true
                                break;
                            case LAError.UserFallback.rawValue:
                                message = "Posar el password es fer trampa"
                                showAlert = true
                                break;
                            default:
                                showAlert = true
                                message = "No tens el touch id configurat"
                                break;
                            }
                            
                            let alertView = UIAlertController(title: "Hmmm...",
                                message: message as String, preferredStyle:.Alert)
                            let okAction = UIAlertAction(title: "Em faig vergonya a mi mateix", style: .Default, handler: nil)
                            alertView.addAction(okAction)
                            if showAlert {
                                self.presentViewController(alertView, animated: true, completion: nil)
                            }
                            
                        }
                    })
                    
            })
        } else {
            
            let alertView = UIAlertController(title: NSLocalizedString("alertTitle", comment: " "),
                message: "No hi ha touchID en aquest dispositiu" as String, preferredStyle:.Alert)
            let okAction = UIAlertAction(title: "Pos vaya", style: .Default, handler: nil)
            alertView.addAction(okAction)
            self.presentViewController(alertView, animated: true, completion: nil)
            
        }
    }

}

