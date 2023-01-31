//
//  BoardVCDelegates.swift
//  Wordle Game
//
//  Created by mohamedSliem on 12/30/22.
//

import UIKit
import SCLAlertView

extension BoardVC: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (presenter?.numberOfRows())!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (presenter?.numberOfItems())!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCollectionViewCell.identifier, for: indexPath) as! BoardCellView
        presenter?.configure(cell: cell, section: indexPath.section, row: indexPath.row)
        return cell as! UICollectionViewCell
        
    }
}


extension BoardVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSize = presenter?.sizeForItem(width: Float(collectionView.frame.width), height: Float(collectionView.frame.height))
        
        return CGSize(width: CGFloat(itemSize!.0), height: CGFloat(itemSize!.1))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
    
}

extension BoardVC: BoardView{
    
    func showIndicatorView() {
        DispatchQueue.main.async {
            self.showIndicator(with: .white, indicatorType: .ballGridPulse, indicatorColor: #colorLiteral(red: 0.1795594722, green: 0.1813372888, blue: 0.1813372888, alpha: 1))
        }
    }
    
    func hideIndicatorView(){
        DispatchQueue.main.async {
            self.hideIndicator()
        }
    }
    
    func reloadBoardView() {
        boardView.reloadData()
    }
    
    func showErrorAlert(title: String, message: String, closeButtonMessage: String) {
        
        let appearnce = SCLAlertView.SCLAppearance(
            kWindowWidth: view.frame.width - 100,
            kTitleFont: UIFont.boldSystemFont(ofSize: 20),
            kTextFont: UIFont.boldSystemFont(ofSize: 17),
            kButtonFont: UIFont.boldSystemFont(ofSize: 16)
        )
 
        let alert = SCLAlertView(appearance: appearnce)
        alert.showError(title, subTitle: message, closeButtonTitle: closeButtonMessage)
    }
    
    
    func showCustomAlert(title: String, message: String){
       
        let appearnce = SCLAlertView.SCLAppearance(
            kWindowWidth: view.frame.width - 100,
            kWindowHeight: 200,
            kTitleFont: UIFont.boldSystemFont(ofSize: 20),
            kTextFont: UIFont.boldSystemFont(ofSize: 17),
            kButtonFont: UIFont.boldSystemFont(ofSize: 16)
        )
        
        let alert = SCLAlertView(appearance: appearnce)
   
        alert.addButton("New Game", backgroundColor: .systemGreen, textColor: .white, showTimeout: .none) {
            self.presenter?.resetAll()
        }
        
        alert.addButton("No", backgroundColor: .systemRed, textColor: .white, showTimeout: .none) {
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.showCustom(title, subTitle: message, color: .white, icon: .actions)
    }
    
}
