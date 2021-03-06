//
//  FirstViewController.swift
//  MobileLabUnlockScreenKit
//
//  Created by katrina jia on 07/02/2018.
//  Copyright © 2018 Mobile Lab. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // Outlet for status label.
    @IBOutlet weak var statusLabel: UILabel!

    // Outlets for image views to provide visual feedback.
    @IBOutlet weak var feedbackIcon1: UIImageView!
    @IBOutlet weak var feedbackIcon2: UIImageView!
    @IBOutlet weak var feedbackIcon3: UIImageView!
    @IBOutlet weak var feedbackIcon4: UIImageView!
    @IBOutlet weak var feedbackIcon5: UIImageView!
    @IBOutlet weak var feedbackIcon6: UIImageView!
    
    // Outlet to reset button.
    @IBOutlet weak var resetButton: UIButton!
    
    /////////////////////////////////
    // UNLOCK SEQEUNCE.
    // Used to compare to input pattern.
    let lockPattern = [3, 1, 2,4,5,6]
    /////////////////////////////////

    // Array to capture input from button taps.
    var inputPattern = [Int]()


    // Override setup function already provided by parent class.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Reset screen on app start.
        resetScreen()
    }

    // Helper method to reset the screen.
    func resetScreen() {
        // Initialize status label.
        statusLabel.text = "Enter Sequence"
        
        // Dim feedback icons.
        feedbackIcon1.alpha = 0.2
        feedbackIcon2.alpha = 0.2
        feedbackIcon3.alpha = 0.2
        feedbackIcon4.alpha = 0.2
        feedbackIcon5.alpha = 0.2
        feedbackIcon6.alpha = 0.2
        
        // Reset button is initially hidden.
        resetButton.isHidden = true

        // Flush input pattern.
        inputPattern.removeAll()
    }
    

    // Callback methods for button presses.
    @IBAction func handleButton1(_ sender: UIButton) {
        // Process current pattern with input 1.
        processInputPattern(inputNumber: 1)
    }

    @IBAction func handleButton2(_ sender: UIButton) {
        // Process current pattern with input 2.
        processInputPattern(inputNumber: 2)
    }
    
    @IBAction func handleButton3(_ sender: UIButton) {
        // Process current pattern with input 3.
        processInputPattern(inputNumber: 3)
    }
    @IBAction func handleButton4(_ sender: UIButton) {
        processInputPattern(inputNumber: 4)
    }
    
    @IBAction func handleButton5(_ sender: UIButton) {
        processInputPattern(inputNumber: 5)
    }
    @IBAction func handleButton6(_ sender: UIButton) {
        processInputPattern(inputNumber: 6)
    }
    
    @IBAction func handleResetButton(_ sender: UIButton) {
        resetScreen()
    }
   
   
    

    // Logic for different stages of the input sequence.
    func processInputPattern(inputNumber: Int) {

        // Append passed in inputNumber into input pattern array.
        inputPattern.append(inputNumber)
        
        // Check where we are in the sequence by inspecting array count.
        if inputPattern.count == 1 {
        
            // Highlight icon 1.
            feedbackIcon1.alpha = 0.7

        } else if inputPattern.count == 2 {

            // Highlight icon 2.
            feedbackIcon2.alpha = 0.7

        } else if inputPattern.count == 3 {
            
            
           feedbackIcon3.alpha = 0.7
            
        }else if inputPattern.count == 4 {
            // Check if pattern matches or need to try again.
            feedbackIcon4.alpha = 0.7
        }else if inputPattern.count == 5 {
            
            feedbackIcon5.alpha = 0.7
            
        }else if inputPattern.count == 6 {
            
            if inputPattern == lockPattern {
                // Highlight icon 6.
                feedbackIcon6.alpha = 0.7

                // Update status message.
                statusLabel.text = "Unlocked"

                // Reveal reset button.
                resetButton.isHidden = false
                //show second view controller
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
                
                self.present(secondViewController, animated: true, completion: nil)
            } else {
                // Reset feedback icons.
                feedbackIcon1.alpha = 0.2
                feedbackIcon2.alpha = 0.2
                feedbackIcon3.alpha = 0.2
                feedbackIcon4.alpha = 0.2
                feedbackIcon5.alpha = 0.2
                feedbackIcon6.alpha = 0.2
                // Update status message.
                statusLabel.text = "Try Again"
                
                // Flush input pattern.
                inputPattern.removeAll()
            }
        }

}
}


