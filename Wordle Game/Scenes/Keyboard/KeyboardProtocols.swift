//
//  KeyboardProtocols.swift
//  Wordle Game
//
//  Created by mohamedSliem on 10/20/22.
//

import Foundation

protocol KeyboardView: class {
    
    var presenter: KeyboardViewPresenter! { get set }
    func changeKeyColor(for section: Int, at indexPath: Int, red: Float, green: Float, blue: Float)
    func reloadKeyboardView()
}

protocol KeyboardViewPresenter: class {
    
    var view: KeyboardView? { get set }
    var keyboardDelegate: KeyboardPressedProtocol? {get set}
    
    init(view: KeyboardView?)
    
    func viewDidLoad()
    
    func numberOfSections() -> Int
    func numberOfChars(for section: Int) -> Int
    func configure(for section: Int, at indexPath: Int, cell: KeyboardCellView)
    
    func pressedKeyboardCell(for section: Int, at indexPath: Int)
    
    func sizeForItem(for section: Int, at indexPath: Int, keyboardWidth: Float) -> (Float, Float)
    
    func insetFor(section: Int, keyboardWidth: Float) -> (Float, Float, Float, Float)
}

protocol KeyboardCellView: class {
    func addImageView()
    func addCharLabel()
    func displayImage(with name: String)
    func displayChar(char: String)
    func changeColor(red: Float, blue: Float, green: Float)
}

protocol KeyboardPressedProtocol: class{
    func pressed(with char: Character)
}
