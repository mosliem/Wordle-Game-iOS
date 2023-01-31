//
//  BoardCollectionViewCell.swift
//  Wordle Game
//
//  Created by mohamedSliem on 12/30/22.
//

import UIKit

class BoardCollectionViewCell: UICollectionViewCell {
    static let identifier = "BoardCollectionViewCell"
    
    private let characterLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(characterLabel)
        configureCharacterLabelConstraints()
        
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
        
        layer.cornerRadius = frame.height / 7
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        characterLabel.text = nil
        backgroundColor = .clear
    }
    

    private func configureCharacterLabelConstraints(){
        
        NSLayoutConstraint.activate([
            characterLabel.topAnchor.constraint(equalTo: self.topAnchor),
            characterLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            characterLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            characterLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
}

extension BoardCollectionViewCell{
    
    func setCharacter(to char: String) {
        characterLabel.text = char
    }
    
    func removeCharacter() {
        characterLabel.text = ""
    }
    
    func setCellColor(red: Float, blue: Float, green: Float) {
        backgroundColor = UIColor(displayP3Red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
    
}


extension BoardCollectionViewCell: BoardCellView{
   
    func set(char: String) {
        characterLabel.text = String(char)
    }
    
    func setCurrentColor(red: Float, blue: Float, green: Float){
        setCellColor(red: red, blue: blue, green: green)
    }
}
