//
//  BoardProtocols.swift
//  Wordle Game
//
//  Created by mohamedSliem on 12/30/22.
//

import Foundation

protocol BoardView: class {
    var presenter: BoardViewPresenter? {get set}
    func reloadBoardView()
    func showErrorAlert(title: String, message: String, closeButtonMessage: String)
    func showCustomAlert(title: String, message: String)
    func showIndicatorView()
    func hideIndicatorView()
}

protocol BoardViewPresenter: class {
    var view: BoardView? {get set}
    var boardView: BoardCollectionViewDelegate? {get set}
    
    var boardColorDelegate: BoardViewColorProtocol? {get set}
    
    func viewDidLoad()
    
    func configure(cell: BoardCellView, section: Int, row: Int)
    func numberOfRows() -> Int
    func numberOfItems() -> Int
    func sizeForItem(width: Float, height: Float) -> (Float, Float)
    
    func resetAll()
}

protocol BoardCellView: class {
    func set(char: String)
    func setCurrentColor(red: Float, blue: Float, green: Float)

}
extension BoardCellView{
}

protocol BoardCollectionViewDelegate: class {
    func setCharacter(for section: Int, at row: Int, char: String)
    func removeCharacter(for section: Int, at row: Int)
    func setCellColor(for section: Int, at row: Int, red: Float, blue: Float, green: Float)
    func flipTranstion(for section: Int, at indexPath: Int)
}


protocol AlertHelperDelegate: class {
    func showNotWordAlert()
}

// protocol to notify the review color for a char on the board 
protocol BoardViewColorProtocol: class{
    func changeColor(for char : Character, red: Float, green: Float, blue: Float)
    func clearAllColor()
}
