//
//  InfoProtocols.swift
//  Wordle Game
//
//  Created by mohamedSliem on 1/31/23.
//

import Foundation


protocol InfoView: class {
    var presenter: InfoViewPresenter? {get set}
    func dismissView()
}

protocol InfoViewPresenter: class {
    var view: InfoView? {get set}
    init(view: InfoView)
    
    func backPressed()
}
