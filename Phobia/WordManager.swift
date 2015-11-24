//
//  WordManager.swift
//  Phobia
//
//  Created by Sudeep Agarwal on 11/21/15.
//  Copyright © 2015 Sudeep Agarwal. All rights reserved.
//

import Foundation
import UIKit

class WordManager {
    
    static let sharedManager = WordManager()
    
    func createWordList() -> [Word] {
        
        var wordList = [Word]()
        
        let heightList = ["mountain", "peak", "summit", "edge", "deep", "cliff", "fall", "collapse", "release", "descent", "leap", "plunge", "crash", "drop-off", "skyscraper", "slip", "clinging", "ladder", "balance"]
        for item in heightList {
            wordList.append(Word(text: item, color: randomColor(), type: WordType.TriggerHeights))
        }
        
        let spiderList = ["web", "crawly", "hair", "angular", "bite", "leggy", "beady", "venom", "fang", "orb", "egg sack", "skitter", "molting", "furry", "scurry", "scuttle", "scamper", "scatter", "cobweb", "pointy"]
        for item in spiderList {
            wordList.append(Word(text: item, color: randomColor(), type: WordType.TriggerSpiders))
        }
        
        let snakeList = ["slither", "squeeze", "poison", "squirm", "scaly", "hiss", "viper", "forked", "suffocate", "slimy", "wriggle", "coil", "reptile", "twine", "legless", "serpent", "oily", "sly"]
        for item in snakeList {
            wordList.append(Word(text: item, color: randomColor(), type: WordType.TriggerSnakes))
        }
        
        let neutralList = ["apple", "square", "pineapple", "drink", "sleepy", "mango", "creative", "microphone", "pen", "highlighter", "pencil", "popcorn", "remote", "internet", "phone", "dance", "mouse", "cat", "fish", "makeup"]
        for item in neutralList {
            wordList.append(Word(text: item, color: randomColor(), type: WordType.Neutral))
        }
        
        wordList.shuffleInPlace()
        
        return wordList
    }

    func randomColor() -> ColorType {
        let colors = [ColorType.Red, ColorType.Blue, ColorType.Green]
        return colors[Int(arc4random_uniform(3))]
    }
    
}