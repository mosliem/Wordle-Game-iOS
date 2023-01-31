//
//  KeyboardVCDelegates.swift
//  Wordle Game
//
//  Created by mohamedSliem on 10/20/22.
//

import UIKit

extension KeyboardVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfChars(for: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyCell.identifier, for: indexPath) as! KeyCell
        presenter.configure(for: indexPath.section, at: indexPath.row, cell: cell)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let sizeForCell = presenter.sizeForItem(
            for: indexPath.section,
            at: indexPath.row,
            keyboardWidth: Float(collectionView.frame.width)
        )
        
        return CGSize(width: CGFloat(sizeForCell.0), height: CGFloat(sizeForCell.1))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        let inset =  presenter.insetFor(section: section, keyboardWidth: Float(collectionView.frame.width))
        return UIEdgeInsets(top: CGFloat(inset.0), left: CGFloat(inset.1), bottom: CGFloat(inset.2), right: CGFloat(inset.3))
    }
    
    // pressed a keyboard button
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.pressedKeyboardCell(for: indexPath.section, at: indexPath.row)
    }
}


extension KeyboardVC: KeyboardView{
    
    func reloadKeyboardView() {
        keyboardCollectionView.reloadData()
    }
    
    func changeKeyColor(for section: Int, at indexPath: Int, red: Float, green: Float, blue: Float) {
        let indexPath = IndexPath(row: indexPath, section: section)
        let cell = keyboardCollectionView.cellForItem(at: indexPath) as! KeyboardCellView
        cell.changeColor(red: red, blue: blue, green: green)
    }
}
