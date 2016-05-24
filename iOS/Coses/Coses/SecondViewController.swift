//
//  SecondViewController.swift
//  Coses
//
//  Created by 1181432 on 27/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    var whichText:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text = whichText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack() {
        self.dismissViewControllerAnimated(true) {
            print("dismissed")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
