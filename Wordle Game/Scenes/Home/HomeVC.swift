//
//  HomeVC.swift
//  Wordle Game
//
//  Created by mohamedSliem on 1/30/23.
//

import UIKit

class HomeVC: UIViewController {

    var presenter: HomeViewPresenter?
    
    @IBOutlet weak var howToPlayButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        howToPlayButton.round(with: 12)
        newGameButton.round(with: 12)
        
        presenter = HomePresenter(view: self)
    }
    
    @IBAction func newGameButtonPressed(_ sender: UIButton) {
        presenter?.newGamePressed()
    }
    
    @IBAction func howToPlayButtonPressed(_ sender: UIButton) {
        presenter?.howToPlayPressed()
    }
    
}
