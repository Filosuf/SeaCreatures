//
//  Penguin.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import Foundation

final class Penguin: SeaCreature, SeaCreaturesProtocol {

    override init(name: String, periodOfBirths: Int, age: Int = 0) {
        self.name = "Penguin"
        self.periodOfBirths = 3
        self.age = 0
    }

    func stepInGame(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreaturesProtocol?]) {
        growth()
        move(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: indexCellsAround, playingField: &playingField)
        reproduction(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: indexCellsAround, playingField: &playingField)
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

    func reproduction(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreaturesProtocol?]) {
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
            playingField[index] = Penguin()
        }
    }
}
