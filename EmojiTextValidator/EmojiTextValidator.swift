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
    
    var allowEmoji = false
    
    
    func validateOnRules(text: String) -> Bool{
        if useCharacterLimit && text.characters.count >= characterMax {
            return false
        }
        
        if useCharacterMax && text.characters.count <= characterMin {
            return false
        }
        
        return true
    }
    
    func validateDate() -> Bool{
        return false
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
            0x1F900...0x1F9FF:  // Supplemental Symbols and Pictographs
                return true
            default: return false
            }
        }
        return false
    }
    
    func isJoinerCharacter(text: UnicodeScalar) -> Bool{
        return text.value == 8205
    }
}
