//
//  SeaCreaturesViewController.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import UIKit

class SeaCreaturesViewController: UIViewController {

    let game = SeaCreaturesGame()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        game.startGame()
        game.makeOneMove()
        for index in stride(from: 0, to: game.sizeOfThePlayingField, by: game.widthOfThePlayingField) {
            print(game.seaCreaturesArray[0 + index], game.seaCreaturesArray[1 + index], game.seaCreaturesArray[2 + index], game.seaCreaturesArray[3 + index])
        }
        game.makeOneMove()
        print(game.seaCreaturesArray)
    }
    


}
