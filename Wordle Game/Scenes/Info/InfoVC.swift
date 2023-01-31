//
//  InfoVC.swift
//  Wordle Game
//
//  Created by mohamedSliem on 1/31/23.
//

import UIKit

class InfoVC: UIViewController {

    var presenter: InfoViewPresenter?

    @IBOutlet weak var backButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
 
        backButton.round(with: 10)
        presenter = InfoPresenter(view: self)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        presenter?.backPressed()
    }
    
}
