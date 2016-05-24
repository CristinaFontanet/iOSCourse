
//  ViewController.swift
//  Game1
//
//  Created by 1181432 on 25/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit


class GameViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var labNumToClick: UILabel!
    @IBOutlet weak var resultat: UILabel!
    @IBOutlet weak var points: UILabel!
    
    var numToClick:Int = 0
    var numPoints: Int = 0
    
    func resetGame() {
        numToClick = Int(arc4random()%100)
        labNumToClick.text = String(numToClick)
        slider.setValue(50.0, animated: true)
        resultat.text = "Click Shoot button"
        numPoints = 0
        points.text = "\(numPoints)"
    }
    
    func resetRandoNum() {
        numToClick = Int(arc4random()%100)
        labNumToClick.text = String(numToClick)
        slider.setValue(50.0, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onShootClick(sender: AnyObject) {
        var feed:String
        
        let diff:Int = abs(numToClick-Int(slider.value))
        
        if diff==0 {
            feed = "PERFECT!"
            numPoints+=10;
        }
        else if diff<5 {
            feed = "Força bé"
            numPoints+=5;
        }
        else { feed = "Torna-ho a intentar"}
        resultat.text = feed
        points.text = String(numPoints)
        resetRandoNum()
    }

    @IBAction func onResetClick(sender: AnyObject) {
        resetGame()
    }
    
    @IBAction func onBack() {
        self.dismissViewControllerAnimated(true) {
            print("dismissed")
        }        
    }
    
}
