//
//  ITellYouViewController.swift
//  dataPassing
//
//  Created by Miguel Berrocal Gómez on 27/01/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import UIKit

class ITellYouViewController: UIViewController {

    @IBOutlet weak var elLabel: UILabel!
    var elText:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = elText {
            if text.characters.count > 0 {
            elLabel.text = text
            }
            else {
                elLabel.text = "Pos vaya :("
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
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
