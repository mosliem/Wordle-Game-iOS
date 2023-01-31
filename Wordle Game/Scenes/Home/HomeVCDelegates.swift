//
//  HomeVCDelegates.swift
//  Wordle Game
//
//  Created by mohamedSliem on 1/31/23.
//

import UIKit


extension HomeVC: HomeView{
    
    func moveToGameContainerVC() {
        let vc = ContainerVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    func moveToInfoVC() {
        let vc = InfoVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    
}

