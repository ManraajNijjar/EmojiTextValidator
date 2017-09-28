//
//  EmojiTextValidator.swift
//  EmojiTextValidator
//
//  Created by Manraaj Nijjar on 9/17/17.
//  Copyright © 2017 Manraaj Nijjar. All rights reserved.
//

import Foundation
import UIKit

class EmojiTextValidator {
    
    var useCharacterLimit = false
    var characterMax = 0
    var useCharacterMax = false
    var characterMin = 0
    
    var noWhiteSpace = false
    
    var allowEmoji = false
    var emojiLimit = 0
    var singleEmojiLimit = 0
    
    
    func validateOnRules(text: String) -> Bool{
        var modText = text
        
        if useCharacterLimit && text.characters.count >= characterMax {
            return false
        }
        
        if useCharacterMax && text.characters.count <= characterMin {
            return false
        }
        
        if noWhiteSpace {
            if text.contains(" "){
                return false
            }
        }
        
        if allowEmoji {
            let charArray = text.characters.filter{isEmoji(character: $0) == false } //Add in check for joiner character
            let _ = charArray.map{modText.append($0)}
        } else {
            if isEmoji(text: text) {
                return false
            }
        }
        
        return true
    }
    
    func emojiSpamCheck(text: String) -> Bool{
        var emojiCount = 0
        var emojiDictionary = [Character: Int]()
        let characters = filterToEmoji(text: text)
        for character in characters {
            if isEmoji(character: character){
                emojiCount += 1
                if emojiCount > emojiLimit {
                    return false
                }

                if emojiDictionary[character] != nil {
                    emojiDictionary[character]! += 1
                } else {
                    emojiDictionary[character] = 1
                }
                if emojiDictionary[character]! > singleEmojiLimit {
                    return false
                }
            }
        }
        return true
    }
    
    func filterToEmoji(text: String) -> [Character]{
        return text.characters.filter{isEmoji(character: $0) == false }
    }
    
    //https://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
    func isEmoji(text: String) -> Bool {
        let scalars = text.unicodeScalars
        for scalar in scalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F,   // Variation Selectors
            0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
            8205:               //Joiner characters
                return true
            default: return false
            }
        }
        return false
    }
    
    func isEmoji(character: Character) -> Bool {
        let charScalar = String(character).unicodeScalars
        switch charScalar.first!.value {
        case 0x1F600...0x1F64F, // Emoticons
        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
        0x1F680...0x1F6FF, // Transport and Map
        0x2600...0x26FF,   // Misc symbols
        0x2700...0x27BF,   // Dingbats
        0xFE00...0xFE0F,   // Variation Selectors
        0x1F900...0x1F9FF,  // Supplemental Symbols and Pictographs
        8205:               //Joiner characters
            return true
        default: return false
        }
    }
    
    func isJoinerCharacter(text: UnicodeScalar) -> Bool{
        return text.value == 8205
    }
    
}
