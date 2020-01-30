//
//  PhotoCreatePlantCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 17/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class PhotoCreatePlantCell: UITableViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    var photo: UIImageView = {
        var photo = UIImageView()
        photo.image = UIImage(named: "AddPhotoImage")
        photo.contentMode = .scaleAspectFill
        return photo
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    
        
        contentView.addSubview(photo)
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        photo.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        photo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        photo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        photo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true

        
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        self.selectionStyle = .none
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder) }

    
}
