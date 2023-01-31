//
//  HomeProtocols.swift
//  Wordle Game
//
//  Created by mohamedSliem on 1/31/23.
//

import Foundation

protocol HomeView: class {
    var presenter: HomeViewPresenter? {get set}
    func moveToGameContainerVC()
    func moveToInfoVC()
}

protocol HomeViewPresenter: class {
    var view: HomeView? {get set}
    init(view: HomeView)
    
    func newGamePressed()
    func howToPlayPressed()
}
