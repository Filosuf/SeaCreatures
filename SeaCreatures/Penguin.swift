//
//  Penguin.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import Foundation

final class Penguin: SeaCreaturesProtocol {


    var age = 0

    func stepInGame(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreaturesProtocol?]) {
        growth()
        move(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: indexCellsAround, playingField: &playingField)
    }

    func growth() {
        age += 1
    }

    func move(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreaturesProtocol?]) {
        if let index = indexCellsAround.randomElement() {
            if playingField[index] == nil {
                playingField[index] = playingField[seaCreaturesIndex]
                playingField[seaCreaturesIndex] = nil
            }
        }
    }
}
