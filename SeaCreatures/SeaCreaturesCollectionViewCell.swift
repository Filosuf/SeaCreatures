//
//  SeaCreaturesCollectionViewCell.swift
//  SeaCreatures
//
//  Created by 1234 on 12.05.2022.
//

import UIKit

class SeaCreaturesCollectionViewCell: UICollectionViewCell {


    private let iconImage: UIImageView = {

        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .systemGray5
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(seaCreature: SeaCreature?) {
        if let _ = seaCreature as? Penguin {
            iconImage.image = UIImage(named: "pinguin")
        } else if let _ = seaCreature as? Orca {
            iconImage.image = UIImage(named: "orca")
        } else {
            iconImage.image = UIImage(named: "sea")
        }
    }

    private func layout() {
        [iconImage].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            iconImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
