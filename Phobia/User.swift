//
//  User.swift
//  Phobia
//
//  Created by Sudeep Agarwal on 11/21/15.
//  Copyright © 2015 Sudeep Agarwal. All rights reserved.
//

import Foundation

enum PhobiaTypes: String {
    case Spiders
    case Snakes
    case Heights
}

class User {
    
    var id: Int!
    var data: [Data]!
    var phobia: [PhobiaTypes]!
    
    init() {
        self.id = UserManager.sharedManager.count
        self.data = [Data]()
        self.phobia = [PhobiaTypes]()
    }
    
    
}