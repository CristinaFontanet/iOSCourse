//
//  ColorsViewController.swift
//  ExerciciTaula
//
//  Created by 1181432 on 2/2/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import UIKit

protocol ColorDelegate {
    func sendColorSelected(text:String, color:UIColor)
}

class ColorsViewController: UIViewController {
    
    var delegate: ColorDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonSelected(sender: UIButton) {
        self.delegate.sendColorSelected(sender.currentTitle!, color: sender.backgroundColor!)
        navigationController?.popViewControllerAnimated(true)

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
