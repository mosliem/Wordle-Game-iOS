//
//  WordChecker.swift
//  Wordle Game
//
//  Created by mohamedSliem on 12/31/22.
//

import UIKit

final class WordChecker {
    
    static let shared = WordChecker()
    private let textChecker = UITextChecker()
    
    private init(){}
    
    
    func checkIfWordExist(from string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf8.count)
        let wrongRange = textChecker.rangeOfMisspelledWord(in: string, range: range, startingAt: 0, wrap: false, language: "en")
        return wrongRange.location == NSNotFound
    }
}
