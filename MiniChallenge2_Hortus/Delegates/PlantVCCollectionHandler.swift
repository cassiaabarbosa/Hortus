//
//  PlantVCHandler.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 25/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class PlantVCCollectionHandler: NSObject, PlantVCDelegate {
    
    var parentVC: PlantVC?
    let taskCollectionCellId: String = "TaskCollectionCellId"
    var plantNames: [String] = ["cassia"] //nomes para estarem na navigation
    
    
    
    
func taskSelected(value: Int) {
}

func didSelect(value: Int) {
}

func delete(uuid: UUID) {
}

}
