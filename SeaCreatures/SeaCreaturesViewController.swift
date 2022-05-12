//
//  SeaCreaturesViewController.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import UIKit

class SeaCreaturesViewController: UIViewController {

    let game = SeaCreaturesGame()
    let ocean = " ocean  "

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        game.startGame()
        for step in 1...6 {
            game.makeOneMove()
            print("step \(step)")
            for index in stride(from: 0, to: game.sizeOfThePlayingField, by: game.widthOfThePlayingField) {
                print(game.seaCreaturesArray[0 + index]?.name ?? ocean, game.seaCreaturesArray[1 + index]?.name ?? ocean, game.seaCreaturesArray[2 + index]?.name ?? ocean, game.seaCreaturesArray[3 + index]?.name ?? ocean)
                print()
            }
            print("--------------------------------------------------------------")
        }
    }
    


}
