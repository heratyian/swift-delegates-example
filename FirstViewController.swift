//
//  ViewController.swift
//  delegate-example
//
//  Created by Ian Heraty on 3/14/16.
//  Copyright © 2016 Ian Heraty. All rights reserved.
//
// from https://www.youtube.com/watch?v=VEvOYG-xB54

import UIKit

let kSecondSegueID = "second"

class FirstViewController: UIViewController, SecondViewControllerDelegate {

    @IBOutlet weak var findOutButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellowColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var secondVC:SecondViewController = SecondViewController()
        secondVC = segue.destinationViewController as! SecondViewController
        secondVC.delegate = self // setting the delegate
    }

    
    @IBAction func findOutButtonTapped(sender: AnyObject) {
        performSegueWithIdentifier(kSecondSegueID, sender: self)
    }
    
    // MARK: SecondViewControllerDelegate
    func giveTheAnserAsYes(yes: Bool) {
        if yes {
            answerLabel.text = "I love chicken"
        } else {
            answerLabel.text = "Chicken is gross"
        }
    }
    
    func changeBackgroundColor(color: UIColor) {
        self.view.backgroundColor = color
    }
    

}

