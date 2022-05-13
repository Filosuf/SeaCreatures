//
//  KillerWhale.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import Foundation

final class Orca: SeaCreature {

    var hunger = 0

    let ocean = " ocean  "

    override init(name: String = Constants().nameOrca, periodOfBirths: Int = Constants().periodOfBirthsOrca, age: Int = 0) {
        super.init(name: name, periodOfBirths: periodOfBirths, age: 0)
    }

    override func growth(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreature?], newSeaCreature: SeaCreature) {
        super.growth(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: indexCellsAround, playingField: &playingField, newSeaCreature: Orca())
        toDie(seaCreaturesIndex: seaCreaturesIndex, playingField: &playingField)
    }

    override func move(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreature?]) -> Int {
        var indexPenguinCellsArray = [Int]()
        //Создание массива индексов ячеек содержащих пингвинов в окрестностях косатки
        for index in indexCellsAround {
            if let _ = playingField[index] as? Penguin {
                indexPenguinCellsArray.append(index)
            }
        }
        //Проверка, найден ли пингвин в окрестности косатки
        if let index = indexPenguinCellsArray.randomElement() {
            playingField[index] = nil //съедаем пингвина
            hunger = 0
            return super.move(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: [index], playingField: &playingField) //перемещаем косатку на место пингвина
        } else {
            //Пингвин не найден, косатка пытается сделать обычноее перемещение
            hunger += 1
            return super.move(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: indexCellsAround, playingField: &playingField)
        }
    }

    private func toDie(seaCreaturesIndex: Int,  playingField: inout [SeaCreature?]) {
        if hunger == Constants().hungerOrca {
            playingField[seaCreaturesIndex] = nil
        }
    }
}
