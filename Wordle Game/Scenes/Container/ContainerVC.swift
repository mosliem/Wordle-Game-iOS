//  HomeVC.swift
//  Wordle Game
//  Created by mohamedSliem on 6/25/22.

import UIKit
import SCLAlertView

class ContainerVC: UIViewController {

   private let keyboardVC = KeyboardVC()
   private let boardVC = BoardVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(displayP3Red:  30 / 255, green: 30 / 255, blue: 30 / 255, alpha: 1.0)
        
        configureKeyboard()
        configureBoard()
        configureKeyboardDelegate()
        configureBoardDelegate()
    }
    
    func configureKeyboard(){
        
        addChild(keyboardVC)
        keyboardVC.didMove(toParent: self)
        keyboardVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyboardVC.view)
        
        NSLayoutConstraint.activate([
            keyboardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureBoard(){
      
        addChild(boardVC)
        boardVC.didMove(toParent: self)
        boardVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(boardVC.view)
        
        NSLayoutConstraint.activate([
            boardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            boardVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            boardVC.view.bottomAnchor.constraint(equalTo: keyboardVC.view.topAnchor),
            boardVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65)
        ])
    }
    
    func configureKeyboardDelegate(){
        keyboardVC.presenter.keyboardDelegate = boardVC.presenter as? KeyboardPressedProtocol
    }
    
    func configureBoardDelegate(){
        boardVC.presenter?.boardColorDelegate = keyboardVC.presenter as? BoardViewColorProtocol
    }

    
}


