# EmojiTextValidator
EmojiTextValidator is a validation library for messaging applictions designed for the sake of handling any and all
text validation that might be required including handling the various emoji that are used throughout iOS messaging

## Installation
For now to install this in your application you'll have to download the EmojiTextValidator.swift file and place it
into your codebase. Then just import the file with 
```
import EmojiTextValidator
```

or access the file directly and then make an EmojiTextValidator object

```
let emojiTextValidator = EmojiTextValidator()
```

## Usage
EmojiTextValidator is used by inserting your text into into one of it's Validator functions and handling the bool that
is returned.
The main function currently in the library is the *validateOnRules()* function which bases itself on whatever rules you
have set for that instance of the class.
For now you can currently setup the following tests and variables

 - useCharacterLimit
 - characterMax
 - useCharacterMax
 - characterMin
    
 - noWhiteSpace
    
 - allowEmoji
 - emojiLimit
 - singleEmojiLimit

  with more variables set to be added in the near future
