//
//  File.swift
//  Wordle Game
//
//  Created by mohamedSliem on 3/11/22.
//

import UIKit

class KeyCell : UICollectionViewCell {
  
    static let identifier = "KeyCell Identifier"

    private let charLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight : .bold)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(displayP3Red: 49/255, green: 49/255, blue: 49/255, alpha: 1.0)
        layer.cornerRadius = frame.height / 10
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        charLabel.text = nil
        imageView.image = nil
        backgroundColor = UIColor(displayP3Red: 49/255, green: 49/255, blue: 49/255, alpha: 1.0)
    }
}


extension KeyCell: KeyboardCellView {
 
    func addImageView(){
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
         ])
        
    }
    
    func addCharLabel(){
        
       contentView.addSubview(charLabel)
        
       NSLayoutConstraint.activate([
           charLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
           charLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
           charLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
           charLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func displayImage(with name: String){
        imageView.image = UIImage(systemName: name)
    }
    
    func displayChar(char: String) {
       charLabel.text = String(char).uppercased()
    }
    
    func changeColor(red: Float, blue: Float, green: Float) {
        backgroundColor = UIColor(displayP3Red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
}
