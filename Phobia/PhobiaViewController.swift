//
//  PhobiaViewController.swift
//  Phobia
//
//  Created by Sudeep Agarwal on 11/21/15.
//  Copyright © 2015 Sudeep Agarwal. All rights reserved.
//

import UIKit
import Alamofire
import mailgun

class PhobiaViewController: UIViewController {
    
    @IBOutlet var spiderButton: UIButton!
    @IBOutlet var snakeButton: UIButton!
    @IBOutlet var heightsButton: UIButton!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func spiderSelected(sender: UIButton) {
        sender.selected = !sender.selected
    }
    
    
    @IBAction func snakeSelected(sender: UIButton) {
        sender.selected = !sender.selected
    }
    
    
    @IBAction func heightsSelected(sender: UIButton) {
        sender.selected = !sender.selected
    }
    
    @IBAction func doneButtonSelected(sender: AnyObject) {
        if (spiderButton.selected) {
            UserManager.sharedManager.currentUser.phobia.append(PhobiaTypes.Spiders)
        }
        if (snakeButton.selected) {
            UserManager.sharedManager.currentUser.phobia.append(PhobiaTypes.Snakes)
        }
        if (heightsButton.selected) {
            UserManager.sharedManager.currentUser.phobia.append(PhobiaTypes.Heights)
        }
        
        sendData()
        
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
    }

    func sendData() {
        let mailgun = Mailgun.clientWithDomain("sandbox3db4a27d4a694aad97b0430530671d3d.mailgun.org", apiKey: "key-eb4c5754a60b1fff504bb76e4e73aa58")
        var text = ""
        text = text + "[user \(UserManager.sharedManager.currentUser.id) "
        for phobia in UserManager.sharedManager.currentUser.phobia {
            text = text + " " + phobia.rawValue
        }
        text = text + "] "
        for data in UserManager.sharedManager.currentUser.data {
            text = text + "[\(data.word.text) \(data.word.type) \(data.time) \(data.isCorrect)] "
        }
        print(text)
        mailgun.sendMessageTo("sudeep135@gmail.com", from: "sudeep135@gmail.com", subject: "PHOBIA: New Data Received", body: text)
        mailgun.sendMessageTo("upandey8@gatech.edu", from: "sudeep135@gmail.com", subject: "PHOBIA: New Data Received", body: text)
        mailgun.sendMessageTo("jduncan45@gatech.edu", from: "sudeep135@gmail.com", subject: "PHOBIA: New Data Received", body: text)
        
    }
    

}
