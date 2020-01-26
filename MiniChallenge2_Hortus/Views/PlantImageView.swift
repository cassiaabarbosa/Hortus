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
//    weak var plantVCDelegate: PlantVCDelegate!
//    var plantImageHandler: PlantImageViewCollectionHandler?
    
    
//    override init(frame: CGRect) {
//        plantImage = UIImageView()
//
//        super.init(frame: frame)
//    }
    
    
//    override init(frame: CGRect){
//        super.init(frame: frame)
//         plantImage = UIImageView()
//         self.plantImage.image = #imageLiteral(resourceName: "AddPhotoImage") //aqui precisa colocar a imagem do CoreData
//
//    }
    override init(frame: CGRect){
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       
    }
    
    
    func setPlantImage(){
        plantImage.image = #imageLiteral(resourceName: "AddPhotoImage")
        self.addSubview(plantImage)
        
        plantImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        plantImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        plantImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        plantImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true 
    }
    
}
