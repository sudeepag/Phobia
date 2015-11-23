//
//  Word.swift
//  Phobia
//
//  Created by Sudeep Agarwal on 11/21/15.
//  Copyright © 2015 Sudeep Agarwal. All rights reserved.
//

import Foundation
import UIKit

enum WordType {
    case Neutral
    case TriggerSpiders
    case TriggerSnakes
    case TriggerHeights
}

enum ColorType {
    case Red
    case Blue
    case Green
}

class Word: Hashable {
    
    var color: ColorType!
    var text: String!
    var type: WordType!
    var hashValue: Int {
        return text.hashValue
    }
    
    init(text: String, color: ColorType, type: WordType) {
        self.text = text
        self.color = color
        self.type = type
    }

}

func ==(lhs: Word, rhs: Word) -> Bool {
    return lhs == rhs
}