//
//  SeaCreaturesViewController.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import UIKit

class SeaCreaturesViewController: UIViewController {

    let game = SeaCreaturesGame()
    let ocean = " ocean  "
    
    lazy var seaCreaturesArray = game.seaCreaturesArray

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray3
        collectionView.register(SeaCreaturesCollectionViewCell.self, forCellWithReuseIdentifier: SeaCreaturesCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override func viewDidLoad() {
        game.startGame()
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }

    private func layout() {
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension SeaCreaturesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        game.sizeOfThePlayingField
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeaCreaturesCollectionViewCell.identifier, for: indexPath) as! SeaCreaturesCollectionViewCell
        cell.setupCell(seaCreature: game.seaCreaturesArray[indexPath.item])
        return cell
    }





}

//MARK: - UICollectionViewDelegateFlowLayout
extension SeaCreaturesViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 1}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - CGFloat(game.widthOfThePlayingField + 1) * sideInset) / CGFloat(game.widthOfThePlayingField)
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        game.makeOneMove()
        collectionView.reloadData()
    }

}

