
//  ViewController.swift
//  Game1
//
//  Created by 1181432 on 25/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var labNumToClick: UILabel!
    @IBOutlet weak var resultat: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var numToClick:Int = 0
    var numPoints: Int = 0
    var maxPoints:Int {
        get {
            return Int(pointsLabel.text!)!
        }
        set {
            pointsLabel.text = String(newValue)
        }
    }
    
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
        let userDefaults = NSUserDefaults.standardUserDefaults()
        maxPoints = userDefaults.integerForKey("highScore")
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
        if(numPoints > maxPoints) {
            maxPoints = numPoints
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setInteger(maxPoints, forKey: "highScore")
        }
        resetRandoNum()
    }

    @IBAction func onResetClick(sender: AnyObject) {
        resetGame()
    }
}

