//
//  Conctants.swift
//  SeaCreatures
//
//  Created by 1234 on 12.05.2022.
//

import Foundation

struct Constants {

    //Размер игрового поля в ячейках
    let heightOfThePlayingField = 15 //15 Minimum: 3
    let widthOfThePlayingField = 10 //10  Minimum: 3

    //Количество занимаемых морскими обитателями ячеек в процентах (округляется до целой ячейки)
    let percentageOfPenguins = 50
    let percentageOfOrca = 5 //5

    //Пингвин
    let namePenguin = " Penguin"
    let periodOfBirthsPenguin = 3 //Количество ходов, через которое будет попытка создать нового пингвина

    //Косатка
    let nameOrca = " Orca  "
    let periodOfBirthsOrca = 8 //Количество ходов, через которое будет попытка создать новую косатку
    let hungerOrca = 3 //Количество ходов, через которое может прожить кастака без еды

}
