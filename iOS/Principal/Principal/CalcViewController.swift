//
//  ViewController.swift
//  Calculadora
//
//  Created by 1181432 on 26/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!    //volem que sempre s'obri
    
    var displayHasNumbers:Bool = false
    
    var operandStack:[Double] = [Double]()
    
    var displayValue:Double {
        get{
            let text = resultLabel.text!    //en vritat això s'hauria de controlar x si el text era null/nil
            return Double(text)! //aixo tm s'hauria de controlar x si la transformació ha fallat
        }
        set{
            resultLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func appendDigitToDisplay(sender: UIButton) {
        if let digit = sender.currentTitle {
            if displayHasNumbers {
                resultLabel.text = resultLabel.text! + digit
            }
            else {
                resultLabel.text = digit
                displayHasNumbers = true
            }
        }
    }
    
    
    @IBAction func returnClicked() {
        displayHasNumbers = false
        operandStack.append(displayValue)
        print(operandStack)
    }
    
    @IBAction func operandClicked(sender: UIButton) {
        let operation = sender.currentTitle!
        
        if(displayHasNumbers) {
            returnClicked()
        }
        
        switch operation {
        case "x":
            performOperation { $0 * $1 }
        case "/":
            performOperation { $1 / $0 }
        case "-":
            performOperation { $1 - $0 }
        case "+":
            performOperation { $0 + $1 }
        default: break
        }
        
        
    }
    //si l'ultim argument és una funció, es pot fer la crida amb la resta d'arguments i la definició al costat -> performOperation(numeroX) {$0 * $1}. 
    //si és l'unic argument, es pot  definir la funció a l'hora de cridar tal qual: performOperation {$0 * $1}
    func performOperation(operation:(Double,Double)->Double) {
        if operandStack.count >= 2  {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
        }
    }
    
/*    func multiply(n1: Double, n2: Double)->Double {
        return n1 * n2
    } */

}

