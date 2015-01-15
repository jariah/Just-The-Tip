//
//  ViewController.swift
//  tips
//
//  Created by Jamie Belsky on 1/14/15.
//  Copyright (c) 2015 tombstone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billField: UITextField!

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var tipPlatform: UIView!
    
    @IBOutlet weak var totalBox: UIView!
    
    var dWidth = UIScreen.mainScreen().bounds.width
    
    var dHeight = UIScreen.mainScreen().bounds.height
    
    let basicBG = UIColor.whiteColor()
    
    let moderateBG = UIColor(red:0.961, green:0.984, blue:0.961, alpha:1.0)
    
    let bestBG = UIColor(red:0.855, green:0.941, blue:0.855 , alpha:1.0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        view.backgroundColor = basicBG
        tipPlatform.alpha = 0.0
        totalBox.frame = CGRect(x: 0, y: dHeight/3.2, width: self.dWidth, height: self.dHeight)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingDidBegin(sender: AnyObject) {
        UIView.animateWithDuration(0.75,
            delay: 0.0,
            options: .CurveEaseInOut,
            animations: {
                self.totalBox.frame = CGRect(x: 0, y: 20, width: self.dWidth, height: self.dHeight)
            },
            completion: { finished in
                UIView.animateWithDuration(1.0, animations: {
                    self.tipPlatform.alpha = 1.0
                })

            }
        )
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

