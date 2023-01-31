//
//  KeyboardPresenter.swift
//  Wordle Game
//
//  Created by mohamedSliem on 3/11/22.
//

import UIKit

class KeyboardPresenter: KeyboardViewPresenter {
    
    weak var view: KeyboardView?
    
    var keyboardDelegate: KeyboardPressedProtocol?
    private var keyboardChars: [[Character]] = []

    required init(view: KeyboardView?) {
        self.view = view
    }
    
    func viewDidLoad() {
        configureLetters()
    }
    
    private func configureLetters(){
        for row in chars {
            let keyRow = Array(row)
            keyboardChars.append(keyRow)
        }
    }
    
    
    func numberOfSections() -> Int {
        return keyboardChars.count
    }
    
    func numberOfChars(for section: Int) -> Int {
        return keyboardChars[section].count
    }
    
    func configure(for section: Int, at indexPath: Int, cell: KeyboardCellView) {
        
        let char = keyboardChars[section][indexPath]

        if char == "-" {
            cell.addImageView()
            cell.displayImage(with: "delete.left.fill")
        }
        else if char == "+"{
            cell.addCharLabel()
            cell.displayChar(char: "Enter")
        }
        else{
            cell.addCharLabel()
            cell.displayChar(char: String(char))
        }
    }
    
    func pressedKeyboardCell(for section: Int, at indexPath: Int) {
        keyboardDelegate?.pressed(with: keyboardChars[section][indexPath])
    }
}


extension KeyboardPresenter {
    
    // size for calculating the button at index path
    func sizeForItem(for section: Int, at indexPath: Int, keyboardWidth: Float) -> (Float, Float){
        
        let margin = 10
        let size = (Int(keyboardWidth) - margin) / 11
        
        if indexPath == 0 && section == 2 {
            return(Float(size) * 2, Float(size) * 1.5)
        }
        
        return(Float(size), Float(size) * 1.5)
    }
    
    // inset for keyboard borders with all screen sizes
    func insetFor(section: Int, keyboardWidth: Float) -> (Float, Float, Float, Float){
        
        let margin = 10
 
        let size = (Int(keyboardWidth) - margin) / 11
        var count = keyboardChars[section].count
        
        if section == 2 {
            count += 1
        }
        
        let inset: Float = Float((Int(keyboardWidth) - (size * count) - (3 * count))) / 2
        
        return (3,inset,3,inset)
    }

}

extension KeyboardPresenter: BoardViewColorProtocol{
    
    func changeColor(for char: Character, red: Float, green: Float, blue: Float) {
        for row in 0 ... 2{
            for col in 0 ..< keyboardChars[row].count{
                if char == keyboardChars[row][col] {
                    view?.changeKeyColor(for: row, at: col, red: red, green: green, blue: blue)
                }
            }
        }
    }
    
    func clearAllColor(){
        view?.reloadKeyboardView()
    }
}

