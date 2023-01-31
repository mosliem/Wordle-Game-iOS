//
//  BoardVC.swift
//  Wordle Game
//
//  Created by mohamedSliem on 6/25/22.
//

import UIKit

class BoardVC: UIViewController {

    var presenter: BoardViewPresenter?

    internal let boardView: BoardCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        
        let collectionView = BoardCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = BoardVCPresenter(view: self, boardView: boardView)
        presenter?.viewDidLoad()
        
        configureGuessesCollectionView()
        setGuessesCollectionViewConstraints()
    }
    
    private func configureGuessesCollectionView(){
        boardView.delegate = self
        boardView.dataSource = self
        boardView.register(BoardCollectionViewCell.self, forCellWithReuseIdentifier: BoardCollectionViewCell.identifier)
        
        view.addSubview(boardView)
    }
    
    private func setGuessesCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            boardView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            boardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            boardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.85),
            boardView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:  25)
        ])
    }
    
    
}
