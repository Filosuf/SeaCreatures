//
//  SeaCreaturesViewController.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import UIKit

class SeaCreaturesViewController: UIViewController {

    let game = SeaCreaturesGame()
    let seaCreaturesView = SeaCreaturesView()
    let ocean = " ocean  "

    override func viewDidLoad() {
        game.startGame()
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
        layout()
    }

    private func setView() {
        seaCreaturesView.collectionView.delegate = self
        seaCreaturesView.collectionView.dataSource = self
        seaCreaturesView.newGameButton.addTarget(self, action: #selector(newGameButtonPressed), for: .touchUpInside)
    }

    @objc private func newGameButtonPressed() {
        game.startGame()
        seaCreaturesView.collectionView.reloadData()
    }

    private func layout() {
        seaCreaturesView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(seaCreaturesView)

        NSLayoutConstraint.activate([

            seaCreaturesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            seaCreaturesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            seaCreaturesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            seaCreaturesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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

