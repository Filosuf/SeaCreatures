//
//  KillerWhale.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import Foundation

final class KillerWhale: SeaCreature {

    var hunger = 0

    let ocean = " ocean  "

    override init(name: String = " KillerW", periodOfBirths: Int = 8, age: Int = 0) {
        super.init(name: name, periodOfBirths: periodOfBirths, age: 0)
    }

    override func growth(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreature?], newSeaCreature: SeaCreature) {
        super.growth(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: indexCellsAround, playingField: &playingField, newSeaCreature: KillerWhale())
        hunger += 1
        toDie(seaCreaturesIndex: seaCreaturesIndex, playingField: &playingField)
    }

    override func move(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreature?]) -> Int {
        var indexPenguinCellsArray = [Int]()
//        print("before hunting")
//        for index in stride(from: 0, to: 16, by: 4) {
//            print(playingField[0 + index]?.name ?? ocean, playingField[1 + index]?.name ?? ocean, playingField[2 + index]?.name ?? ocean, playingField[3 + index]?.name ?? ocean)
//            print()
//        }
        //Создание массива индексов ячеек содержащих пингвинов в окрестностях касатки
        for index in indexCellsAround {
            if let _ = playingField[index] as? Penguin {
                indexPenguinCellsArray.append(index)
            }
        }
        //Проверка, найден ли пингвин в окрестности касатки
        if let index = indexPenguinCellsArray.randomElement() {
            playingField[index] = nil //съедаем пингвина
            hunger = 0
            print("KillerWhale index = \(seaCreaturesIndex) eating penguin in index = \(index)")
//            print("after hunting")
//            for index in stride(from: 0, to: 16, by: 4) {
//                print(playingField[0 + index]?.name ?? ocean, playingField[1 + index]?.name ?? ocean, playingField[2 + index]?.name ?? ocean, playingField[3 + index]?.name ?? ocean)
//                print()
//            }
            return super.move(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: [index], playingField: &playingField) //перемещаем касатку на место пингвина
        } else {
            //Пингвин не найден, пытаемся сделать обычноее перемещение
            return super.move(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: indexCellsAround, playingField: &playingField)
        }
    }

    private func toDie(seaCreaturesIndex: Int,  playingField: inout [SeaCreature?]) {
        if hunger == 1 {
            playingField[seaCreaturesIndex] = nil
            print("Killer index = \(seaCreaturesIndex) dead")
            print("after dead")
            for index in stride(from: 0, to: 16, by: 4) {
                print(playingField[0 + index]?.name ?? ocean, playingField[1 + index]?.name ?? ocean, playingField[2 + index]?.name ?? ocean, playingField[3 + index]?.name ?? ocean)
                print()
            }
        }
    }
}
