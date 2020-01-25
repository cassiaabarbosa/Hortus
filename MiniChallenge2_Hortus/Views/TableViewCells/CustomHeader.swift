//
//  CustomHeader.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 23/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    
    let image = UIImageView()
    let title = UILabel()
    
    let titleForSection: [String] = [" ","Floração", "Colheita","Exposição Solar", "Fertilizantes", "Rega", "Poda", "Pesticidas"]
    let imageForSection: [UIImage] = [#imageLiteral(resourceName: "AddPhotoButton"), #imageLiteral(resourceName: "Flower"), #imageLiteral(resourceName: "Harvest"), #imageLiteral(resourceName: "Sun"), #imageLiteral(resourceName: "Booster"), #imageLiteral(resourceName: "Drop"), #imageLiteral(resourceName: "Scisor"), #imageLiteral(resourceName: "Pesticide")]
    
     override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
            setContents()
        }
    
    
    func setContents() {
        
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(image)
        contentView.addSubview(title)
        
        
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        image.bottomAnchor.constraint(equalTo:contentView.bottomAnchor).isActive = true

        title.heightAnchor.constraint(equalToConstant: 30).isActive = true
        title.leadingAnchor.constraint(equalTo: image.trailingAnchor,
            constant: 5).isActive = true
        title.bottomAnchor.constraint(equalTo:contentView.bottomAnchor).isActive = true
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

