//
//  SeaCreature.swift
//  SeaCreatures
//
//  Created by 1234 on 12.05.2022.
//

import Foundation

class SeaCreature {

    var name = "SeaCreature"
    var age: Int
    var periodOfBirths: Int

    init(name: String, periodOfBirths: Int, age: Int = 0) {
        self.name = name
        self.periodOfBirths = periodOfBirths
        self.age = age
    }
    
    func growth(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreature?], newSeaCreature: SeaCreature = SeaCreature(name: "", periodOfBirths: 0)) {
        age += 1
        reproduction(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: indexCellsAround, playingField: &playingField, newSeaCreature: newSeaCreature)
    }

    func move(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreature?]) -> Int {
        if let index = indexCellsAround.randomElement() {
            if playingField[index] == nil {
                playingField[index] = playingField[seaCreaturesIndex]
                playingField[seaCreaturesIndex] = nil
                print("\(name) index = \(seaCreaturesIndex) move to index = \(index)")
                return index
            }
        }
        print("\(name) index = \(seaCreaturesIndex) dont move")
        return seaCreaturesIndex
    }

    func reproduction(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreature?], newSeaCreature: SeaCreature) {
        var indexEmptyCellsAround = [Int]()

        //проверка возраста морского обитателя
        guard age % periodOfBirths == 0 else { return }
        //Добавление в массив пустых ячеек вокруг морского обитателя
        for index in indexCellsAround {
            if playingField[index] == nil {
                indexEmptyCellsAround.append(index)
            }
        }
        //Создание нового морского обитателя если есть свободная ячейка
        if let index = indexEmptyCellsAround.randomElement() {
            playingField[index] = newSeaCreature
            print("The birth of \(name), index = \(index)")
        }
    }

}
