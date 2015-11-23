//
//  Data.swift
//  Phobia
//
//  Created by Sudeep Agarwal on 11/21/15.
//  Copyright © 2015 Sudeep Agarwal. All rights reserved.
//

import Foundation

class Data {
    
    var word: Word!
    var time: Double!
    var isCorrect: Bool!
    
    init(word: Word, time: Double, colorSelected: ColorType) {
        self.word = word
        self.time = time
        self.isCorrect = (word.color == colorSelected)
    }
    
}