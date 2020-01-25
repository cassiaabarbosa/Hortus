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
public class PlantImageView: UIView {
    
    var plantImage: UIImageView!
//    weak var plantVCDelegate: PlantVCDelegate!
//    var plantImageHandler: PlantImageViewCollectionHandler?
    
    
//    override init(frame: CGRect) {
//        plantImage = UIImageView()
//
//        super.init(frame: frame)
//    }
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
         plantImage = UIImageView()
         self.plantImage.image = #imageLiteral(resourceName: "red rose") //aqui precisa colocar a imagem do CoreData
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       
    }
    
}
