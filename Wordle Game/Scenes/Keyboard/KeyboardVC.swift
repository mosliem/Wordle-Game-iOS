

import UIKit

class KeyboardVC: UIViewController {
    
    var presenter: KeyboardViewPresenter!

    let keyboardCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 3
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = KeyboardPresenter(view: self)
        presenter.viewDidLoad()
        
        configureCollectionView()
        setKeyboardCollectionConstraints()
    }
    
    private func configureCollectionView() {
       

        keyboardCollectionView.delegate = self
        keyboardCollectionView.dataSource = self
        keyboardCollectionView.register(KeyCell.self, forCellWithReuseIdentifier: KeyCell.identifier)

        view.addSubview(keyboardCollectionView)
    }
    
    private func setKeyboardCollectionConstraints(){
        NSLayoutConstraint.activate([
                keyboardCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                keyboardCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                keyboardCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
                keyboardCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
    }
}


