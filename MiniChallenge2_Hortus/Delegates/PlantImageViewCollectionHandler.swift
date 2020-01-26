//
//  PlantImageViewCollectionHandler.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 25/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class PlantImageViewCollectionHandler: NSObject, PlantImageViewDelegate {
    
    var plantImages: [String] = [] //colocar aqui o nome das imagens das plantas do coreData
    
    var parentVC: PlantImageView?
    
    
    func setImage(name: String) {
        parentVC?.plantImage.image = UIImage(named: name)
    }
    
    
}


