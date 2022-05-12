//
//  SeaCreaturesProtocol.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import Foundation

protocol SeaCreaturesProtocol {

    func stepInGame(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreaturesProtocol?])
}
