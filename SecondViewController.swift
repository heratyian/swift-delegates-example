//
//  SecondViewController.swift
//  delegate-example
//
//  Created by Ian Heraty on 3/14/16.
//  Copyright © 2016 Ian Heraty. All rights reserved.
//

import UIKit

@objc protocol SecondViewControllerDelegate: class {
    func giveTheAnserAsYes(yes:Bool)
    
    optional func changeBackgroundColor(color:UIColor)
}

class SecondViewController: UIViewController {

    var delegate:SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.greenColor()
    }

    @IBAction func answerButtonTapped(sender: UIButton) {
        if sender.tag == 0 {
            
            print("no")
            // answer is NO
            dismissViewControllerAnimated(true, completion: { () -> Void in
                self.delegate?.giveTheAnserAsYes(false)
                self.delegate?.changeBackgroundColor!(UIColor.greenColor())
            })
        } else {
            print("yes")
            // answer is YES
            dismissViewControllerAnimated(true, completion: { () -> Void in
                self.delegate?.giveTheAnserAsYes(true)
                self.delegate?.changeBackgroundColor!(UIColor.redColor())
            })
        }
    }
    
}
