//
//  InfoPresenter.swift
//  Wordle Game
//
//  Created by mohamedSliem on 1/31/23.
//

import Foundation

class InfoPresenter: InfoViewPresenter {
   
    weak var view: InfoView?
    
    required init(view: InfoView) {
        self.view = view
    }
    
    func backPressed() {
        view?.dismissView()
    }
    
}
