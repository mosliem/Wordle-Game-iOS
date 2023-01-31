//
//  HomePresenter.swift
//  Wordle Game
//
//  Created by mohamedSliem on 1/31/23.
//

import Foundation

class HomePresenter: HomeViewPresenter {
    weak var view: HomeView?
    
    required init(view: HomeView) {
        self.view = view
    }
    
    func newGamePressed() {
        view?.moveToGameContainerVC()
    }
    
    func howToPlayPressed() {
        view?.moveToInfoVC()
    }
    
}
