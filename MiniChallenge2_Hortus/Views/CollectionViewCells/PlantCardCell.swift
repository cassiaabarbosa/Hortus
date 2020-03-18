//
//  PlantCardCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 14/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//

import UIKit
import CoreData

class PlantCardCell: UICollectionViewCell {
    
    var plantIndex:Int?
    
    var namePlantLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = #colorLiteral(red: 0.5336075425, green: 0.7177075744, blue: 0.4416005611, alpha: 1)
        label.text = "Hortência"
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 20
        label.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return label
    }()
    
    
    
    let plantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hotencia")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    
    var plant: Plant?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        addSubview(plantImageView)
        addSubview(namePlantLabel)
        
        plantImageView.layer.masksToBounds = true
        namePlantLabel.layer.masksToBounds = true
        
        backgroundColor = .none
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1
        
        
        plantImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        plantImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        plantImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        plantImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true

        namePlantLabel.bottomAnchor.constraint(equalTo: self.plantImageView.bottomAnchor).isActive = true
        namePlantLabel.leadingAnchor.constraint(equalTo: self.plantImageView.leadingAnchor).isActive = true
        namePlantLabel.trailingAnchor.constraint(equalTo: self.plantImageView.trailingAnchor).isActive = true
        namePlantLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
