//
//  ViewController.swift
//  dataPassing
//
//  Created by Miguel Berrocal Gómez on 27/01/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cosesTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func viewDidAppear(animated: Bool) {
        performSegueWithIdentifier("programaticSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "showNext" {
                if let destination = segue.destinationViewController as? ITellYouViewController {
                    destination.elText = cosesTextField.text
                }
            }
        }
    }


}

