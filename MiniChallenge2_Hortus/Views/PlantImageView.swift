//
//  PlantImageView.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 25/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class PlantImageView: UIView {
    
    var plantImage: UIImageView

    override init(frame: CGRect){
        
        self.plantImage = UIImageView()
        super.init(frame: frame)
        setPlantImage()
        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.plantImage = UIImageView()
        super.init(coder: aDecoder)
        
    }
    
    
    func setPlantImage() {
        self.addSubview(plantImage)
        self.plantImage.translatesAutoresizingMaskIntoConstraints = false
        plantImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        plantImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        plantImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        plantImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
}
