//
//  Conctants.swift
//  SeaCreatures
//
//  Created by 1234 on 12.05.2022.
//

import Foundation

struct Constants {

    //Размер игрового поля в ячейках
    let heightOfThePlayingField = 10 //15 Minimum: 3
    let widthOfThePlayingField = 5 //10  Minimum: 3

    //Количество занимаемых морскими обитателями ячеек в процентах (округляется до целой ячейки)
    let percentageOfPenguins = 50
    let percentageOfKillerWhale = 5 //5

    //Пингвин
    let namePenguin = " Penguin"
    let periodOfBirthsPenguin = 3 //Количество ходов, через которое будет попытка создать нового пингвина

    //Косатка
    let nameKillerWhale = " Orca  "
    let periodOfBirthsKillerWhale = 8 //Количество ходов, через которое будет попытка создать новую косатку
    let hungerKillerWhale = 3 //Количество ходов, через которое может прожить кастака без еды

}
