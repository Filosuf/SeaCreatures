//
//  SeaCreaturesGame.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import Foundation

final class SeaCreaturesGame {

    let heightOfThePlayingField = Constants().heightOfThePlayingField
    let widthOfThePlayingField = Constants().widthOfThePlayingField
    lazy var sizeOfThePlayingField = heightOfThePlayingField * widthOfThePlayingField

    let percentageOfPenguins = Constants().percentageOfPenguins
    let percentageOfKillerWhale = Constants().percentageOfKillerWhale

    var numberOfPenguins: Int {
        heightOfThePlayingField * widthOfThePlayingField * percentageOfPenguins / 100
    }
    var numberOfKillerWhale: Int {
        heightOfThePlayingField * widthOfThePlayingField * percentageOfKillerWhale / 100
    }

    var seaCreaturesArray = [SeaCreature?]()

    let penguin = Penguin()
    let killerWhale = KillerWhale()

//    var indexOneStep = 0
//    var indexOneStepFull = 0
//    var seaCreatureMemory: SeaCreature?
    //масив координат ячеек уже сходивших на этом ходу
    var busyCellsArray = [Int]()

    func startGame() {
        //Создание массива с индесами игрового поля
        var playingFieldArray = [Int]()
        for index in 0..<sizeOfThePlayingField {
            playingFieldArray.append(index)
            seaCreaturesArray.append(nil)
        }
        //Расстановка пингвинов
        for _ in 0..<numberOfPenguins {
            if let index = playingFieldArray.randomElement() {
                playingFieldArray.removeAll(where: {$0 == index})
                seaCreaturesArray[index] = Penguin()
            }
        }
        //Растановка касаток
        for _ in 0..<numberOfKillerWhale {
            if let index = playingFieldArray.randomElement() {
                playingFieldArray.removeAll(where: {$0 == index})
                seaCreaturesArray[index] = KillerWhale()
            }
        }
    }

    func makeOneMove() {
//        масив координат ячеек уже сходивших на этом ходу
        var busyCellsArray = [Int]()

        for (index, seaCreature) in seaCreaturesArray.enumerated() {
            if let seaCreature = seaCreature {
                if busyCellsArray.firstIndex(of: index) == nil {
                    let newIndex = seaCreature.move(seaCreaturesIndex: index, indexCellsAround: creatingIndexCellsAround(index: index), playingField: &seaCreaturesArray)
                    busyCellsArray.append(newIndex)
                    seaCreature.growth(seaCreaturesIndex: newIndex, indexCellsAround: creatingIndexCellsAround(index: newIndex), playingField: &seaCreaturesArray)
                }
            }
        }
        //feature. move one SeaCreature
//        repeat {
//            seaCreatureMemory = seaCreaturesArray[indexOneStep]
//            if let seaCreature = seaCreaturesArray[indexOneStep] {
//                if busyCellsArray.firstIndex(of: indexOneStep) == nil {
//                    let newIndex = seaCreature.move(seaCreaturesIndex: indexOneStep, indexCellsAround: creatingIndexCellsAround(index: indexOneStep), playingField: &seaCreaturesArray)
//                    print("Исключающий индекс\(newIndex)")
//                    busyCellsArray.append(newIndex)
//                    seaCreature.growth(seaCreaturesIndex: newIndex, indexCellsAround: creatingIndexCellsAround(index: newIndex), playingField: &seaCreaturesArray)
//                }
//            }
//            print("repeat \(indexOneStep); \(seaCreatureMemory?.name ?? "sea")")
//            if indexOneStep == sizeOfThePlayingField {
//                busyCellsArray[0...busyCellsArray.count-1] = []
//            }
//            indexOneStepFull += 1
//            indexOneStep = indexOneStepFull % sizeOfThePlayingField
//        } while seaCreatureMemory == nil
    }

    //Создание массива с индексами ячеек окружаемые искомую ячейку
    private func creatingIndexCellsAround(index center: Int) -> [Int] {
        var indexCellsAround = [Int]()
        //попытка добавить три верхних элемента
        for index in center - widthOfThePlayingField - 1...center - widthOfThePlayingField + 1 {
            appendElement(center: center, index: index, array: &indexCellsAround)
        }
        //попытка добавить элемент слева
        appendElement(center: center, index: center - 1, array: &indexCellsAround)
        //попытка добавить элемент справа
        appendElement(center: center, index: center + 1, array: &indexCellsAround)
        //попытка добавить 3 нижних элемента
        for index in center + widthOfThePlayingField - 1...center + widthOfThePlayingField + 1 {
            appendElement(center: center, index: index, array: &indexCellsAround)
        }
        return indexCellsAround
    }

    private func appendElement(center: Int, index: Int, array: inout [Int]) {
        //Проверка, что добавляемы индекс находится в пределах таблицы (ограничение для первой и последней строки)
        if index >= 0 && index < sizeOfThePlayingField {
            //ограничение для первого столбца
            if center % widthOfThePlayingField == 0 {
                if index % widthOfThePlayingField < 2 {
                    array.append(index)
                }
            //ограничение для последнего столбца
            } else if (center + 1) % widthOfThePlayingField == 0 {
                if index % widthOfThePlayingField > 0 {
                    array.append(index)
                }
            } else {
                array.append(index)
            }
        }
    }

}
