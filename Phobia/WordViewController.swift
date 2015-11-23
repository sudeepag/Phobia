//
//  WordViewController.swift
//  Phobia
//
//  Created by Sudeep Agarwal on 11/21/15.
//  Copyright © 2015 Sudeep Agarwal. All rights reserved.
//

import UIKit

class WordViewController: UIViewController {
    
    var wordList: [Word]!
    var currentWordIndex = -1
    var timer: NSTimer!
    var time = 0.0
    var sessionHasBegun = false

    @IBOutlet var redButton: UIButton!
    @IBOutlet var blueButton: UIButton!
    @IBOutlet var greenButton: UIButton!
    
    @IBOutlet var instructionLabel: UILabel!
    @IBOutlet var plusLabel: UILabel!
    @IBOutlet var wordLabel: UILabel!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        wordList = WordManager.sharedManager.createWordList()
        for word in wordList {
            print(word.text)
        }
        
        wordLabel.hidden = true
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        redButton.layer.cornerRadius = redButton.frame.width / 2.0
        redButton.layer.masksToBounds = true
        
        blueButton.layer.cornerRadius = blueButton.frame.width / 2.0
        blueButton.layer.masksToBounds = true
        
        greenButton.layer.cornerRadius = greenButton.frame.width / 2.0
        greenButton.layer.masksToBounds = true
    }
    
    func showWord() {
        
        currentWordIndex = currentWordIndex + 1
        
        if (currentWordIndex >= wordList.count) {
            
            performSegueWithIdentifier("showPhobiaVC", sender: self)
            
        } else {
            
            wordLabel.text = wordList[currentWordIndex].text
            wordLabel.textColor = colorForType(wordList[currentWordIndex].color)
            
            plusLabel.hidden = true
            wordLabel.hidden = false
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: "timerFired", userInfo: nil, repeats: true)
            
        }
        
    }
    
    func showPlus() {
        wordLabel.hidden = true
        plusLabel.hidden = false
        
        timer.invalidate()
        timer = nil
        time = 0.0
        
        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64((drand48() + 1.0) * Double(NSEC_PER_SEC)))
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            self.showWord()
        })
        
        
    }
    
    func timerFired() {
        time = time + 0.001
        
    }
    
    @IBAction func buttonClicked(sender: UIButton) {
        print(sender.tag)
        
        let word = wordList[currentWordIndex]
        
        switch sender.tag {
        case 0:
            print("red")
            UserManager.sharedManager.addDataPoint(Data(word: word, time: time, colorSelected: ColorType.Red))
        case 1:
            print("blue")
            UserManager.sharedManager.addDataPoint(Data(word: word, time: time, colorSelected: ColorType.Blue))
        case 2:
            print ("green")
            UserManager.sharedManager.addDataPoint(Data(word: word, time: time, colorSelected: ColorType.Green))
        default:
            print("")
        }
        
        showPlus()
    }
    
    func colorForType(type: ColorType) -> UIColor {
        switch(type) {
        case ColorType.Red:
            return UIColor(red:1.00, green:0.34, blue:0.37, alpha:1.0)
        case ColorType.Blue:
            return UIColor(red:0.36, green:0.47, blue:1.00, alpha:1.0)
        case ColorType.Green:
            return UIColor(red:0.39, green:1.00, blue:0.54, alpha:1.0)
        }
    }
    
    func removeInstructions() {
        self.instructionLabel.hidden = true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if (!sessionHasBegun) {
            removeInstructions()
            showWord()
            sessionHasBegun = true
        }
        
    }

}
