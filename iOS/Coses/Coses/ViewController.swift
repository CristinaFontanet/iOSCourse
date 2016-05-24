//
//  ViewController.swift
//  Coses
//
//  Created by 1181432 on 27/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var continueButton: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userText.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        print(segueIdentifier)
        
        switch segueIdentifier {
        case "showCoses":
            let destination = segue.destinationViewController as! SecondViewController
            if userText.text != "" {
                destination.whichText = userText.text
            }
            else {
                destination.whichText = "Pos vaya"
            }
            
        default: break
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == userText {
            textField.resignFirstResponder()
            performSegueWithIdentifier("showCoses", sender: self)
            return false
        }
        return true
    }

}

