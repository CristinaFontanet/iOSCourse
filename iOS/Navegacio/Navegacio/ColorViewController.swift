//
//  GreenViewController.swift
//  Navegacio
//
//  Created by 1181432 on 26/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var elLabel: UILabel!
    
    var whichText:String!
    var whichColor:UIColor!
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elLabel.text = whichText
        print("Carrego el color")
        self.view.backgroundColor = whichColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goBack() {
        self.dismissViewControllerAnimated(true) {
            print("COLOR dismissed")
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
