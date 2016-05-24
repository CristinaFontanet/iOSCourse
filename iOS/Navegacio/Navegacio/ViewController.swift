//
//  ViewController.swift
//  Navegacio
//
//  Created by 1181432 on 26/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var returnLabel: UILabel!
    var someText:String!
    var someColor:UIColor!
    
    var returnText:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        returnText = "Encara no has anat enlloc"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func blueClicked(sender: UIButton) {
        someText = "HOLA BLAU"
        someColor = sender.backgroundColor
        performSegueWithIdentifier("showColor", sender: self)
    }
    
    @IBAction func orangeClicked(sender: UIButton) {
        someText = "HOLA TARONJA"
        someColor = sender.backgroundColor
        performSegueWithIdentifier("showColor", sender: self)
    }
    
    @IBAction func greenClicked(sender: UIButton) {
        someText = "HOLA VERD"
        someColor = sender.backgroundColor
        performSegueWithIdentifier("showColor", sender: self)
    }
    
    func colorEnded() {
        returnLabel.text = "JA HE TORNAAAT"        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        print(segueIdentifier)
        
        switch segueIdentifier {
            case "showColor":
            let destination = segue.destinationViewController as! ColorViewController
            destination.whichText = someText
            destination.whichColor = someColor
            
        default: break
        }
        
    }


}

