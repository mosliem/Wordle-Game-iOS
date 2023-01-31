//
//  BoardCollectionView.swift
//  Wordle Game
//
//  Created by mohamedSliem on 12/31/22.
//

import UIKit


class BoardCollectionView: UICollectionView{
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cell(for section: Int, at row: Int) -> BoardCollectionViewCell{
        let indexPath = IndexPath(row: row, section: section)
        let cell = cellForItem(at: indexPath) as! BoardCollectionViewCell
        return cell
    }
    
    private func setChar(for section: Int, at row: Int, char: String){
        let boardCell = cell(for: section, at: row)
        boardCell.setCharacter(to: char)
    }
    
    private func deleteChar(for section: Int, at row: Int){
        let boardCell = cell(for: section, at: row)
        boardCell.removeCharacter()
    }
    
    private func changeColor(for section: Int, at row: Int, red: Float, blue: Float, green: Float){
        let boardCell = cell(for: section, at: row)
        boardCell.setCellColor(red: red, blue: blue, green: green)
    }
    
 
}

extension BoardCollectionView: BoardCollectionViewDelegate{
    
    func setCharacter(for section: Int, at row: Int, char: String) {
        setChar(for: section, at: row, char: char)
    }
    
    func removeCharacter(for section: Int, at row: Int) {
         deleteChar(for: section, at: row)
    }
    
    func setCellColor(for section: Int, at row: Int, red: Float, blue: Float, green: Float) {
        changeColor(for: section, at: row, red: red, blue: blue, green: green)
    }
    
    func flipTranstion(for section: Int, at indexPath: Int){
        let boardCell = cell(for: section, at: indexPath)
        UIView.transition(with: boardCell, duration: 0.7, options: .transitionFlipFromBottom, animations: nil, completion: nil)
    }
    
}
