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

protocol PlantImageViewDelegate: class {
    func setImage(name: String)
}


@IBDesignable
class PlantImageView: UIView {
    
    var plantImage: UIImageView!

    override init(frame: CGRect){
        super.init(frame: frame)
        //precisa por a imagem do CoreData
        plantImage = UIImageView()
        setPlantImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       
    }
    
    
    func setPlantImage(){
        
        plantImage.image = #imageLiteral(resourceName: "AddPhotoImage")
        self.addSubview(plantImage)
        self.plantImage.translatesAutoresizingMaskIntoConstraints = false
        plantImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        plantImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        plantImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        plantImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
}
