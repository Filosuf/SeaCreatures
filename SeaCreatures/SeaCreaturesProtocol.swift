//
//  SeaCreaturesProtocol.swift
//  SeaCreatures
//
//  Created by 1234 on 11.05.2022.
//

import Foundation

protocol SeaCreaturesProtocol: AnyObject {

    var name: String { get }

    func stepInGame(seaCreaturesIndex: Int, indexCellsAround: [Int], playingField: inout [SeaCreaturesProtocol?])
}
