//
//  Penguin.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import Foundation

final class Penguin: SeaCreature {

    override init(name: String = Constants().namePenguin, periodOfBirths: Int = Constants().periodOfBirthsPenguin, age: Int = 0) {
        super.init(name: name, periodOfBirths: periodOfBirths, age: 0)
    }

    override func growth(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreature?], newSeaCreature: SeaCreature) {
        super.growth(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: indexCellsAround, playingField: &playingField, newSeaCreature: Penguin())
    }

}
