//
//  KillerWhale.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import Foundation

final class KillerWhale: SeaCreaturesProtocol {

    var name = " KillerW"
    var age = 0
    let periodOfBirths = 2
    var hunger = 0

    let ocean = " ocean  "

    func stepInGame(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreaturesProtocol?]) {
        growth()
        let newSeaCreaturesIndex = hunting(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: indexCellsAround, playingField: &playingField)
        reproduction(seaCreaturesIndex: newSeaCreaturesIndex, indexCellsAround: indexCellsAround, playingField: &playingField)
        toDie(seaCreaturesIndex: newSeaCreaturesIndex, playingField: &playingField)
    }

    

    private func growth() {
        age += 1
        hunger += 1
    }

    private func hunting(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreaturesProtocol?]) -> Int {
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
            playingField[index] = nil //съедем пингвина
            hunger = 0
            print("Killre index = \(seaCreaturesIndex) eating penguin in index = \(index)")
            return move(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: [index], playingField: &playingField) //перемещаем касатку на место пингвина
        } else {
            //Пингвин не найден, пытаемся сделать обычноее перемещение
            return move(seaCreaturesIndex: seaCreaturesIndex, indexCellsAround: indexCellsAround, playingField: &playingField)
        }
    }

    private func move(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreaturesProtocol?]) -> Int {
        if let index = indexCellsAround.randomElement() {
            if playingField[index] == nil {
                playingField[index] = playingField[seaCreaturesIndex]
                playingField[seaCreaturesIndex] = nil
//                return index
                print("Killre index = \(seaCreaturesIndex) move to index = \(index)")
                return index
            }
        }
        return seaCreaturesIndex
    }

    private func reproduction(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreaturesProtocol?]) {
        var indexEmptyCellsAround = [Int]()

        //проверка возраста морского обитателя
        guard age % periodOfBirths == 0 else { return }
        print("before reproduction")
        for index in stride(from: 0, to: 16, by: 4) {
            print(playingField[0 + index]?.name ?? ocean, playingField[1 + index]?.name ?? ocean, playingField[2 + index]?.name ?? ocean, playingField[3 + index]?.name ?? ocean)
            print()
        }
        //Добавление в массив пустых ячеек вокруг морского обитателя
        for index in indexCellsAround {
            if playingField[index] == nil {
                indexEmptyCellsAround.append(index)
            }
        }
        //Создание нового морского обитателя если есть свободная ячейка
        if let index = indexEmptyCellsAround.randomElement() {
            playingField[index] = KillerWhale()
            print("New Killer index = \(index)")
        }
        print("after reproduction")
        for index in stride(from: 0, to: 16, by: 4) {
            print(playingField[0 + index]?.name ?? ocean, playingField[1 + index]?.name ?? ocean, playingField[2 + index]?.name ?? ocean, playingField[3 + index]?.name ?? ocean)
            print()
        }
    }

    private func toDie(seaCreaturesIndex: Int,  playingField: inout [SeaCreaturesProtocol?]) {
        if hunger == 3 {
            playingField[seaCreaturesIndex] = nil
            print("Killer index = \(seaCreaturesIndex) dead")
        }
    }
}
