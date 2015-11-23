//
//  UserManager.swift
//  Phobia
//
//  Created by Sudeep Agarwal on 11/21/15.
//  Copyright © 2015 Sudeep Agarwal. All rights reserved.
//

import Foundation

class UserManager {
    
    static let sharedManager = UserManager()
    
    var count: Int!
    var currentUser: User!
    
    func createUser() {
        currentUser = User()
        if count == nil {
            count = 0
        }
        count = count + 1
    }
    
    func addDataPoint(data: Data) {
        currentUser.data.append(data)
        print("data added: \(data.word.text), \(data.time), \(data.isCorrect)")
    }
    
}