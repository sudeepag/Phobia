//
//  ViewController.swift
//  Phobia
//
//  Created by Sudeep Agarwal on 11/21/15.
//  Copyright © 2015 Sudeep Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
    }

    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        UserManager.sharedManager.createUser()
    }


}

