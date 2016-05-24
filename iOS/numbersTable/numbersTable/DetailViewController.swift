//
//  DetailViewController.swift
//  numbersTable
//
//  Created by 1181432 on 28/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var whichRecord:Record!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backImage.image = UIImage(named: whichRecord.imageName)
        self.title = whichRecord.title
        textLabel.text = whichRecord.description
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
