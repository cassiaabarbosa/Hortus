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
		photo.contentMode = .scaleToFill
		photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(photo)

        photo.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photo.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photo.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        photo.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        self.separatorInset = .zero
        self.selectionStyle = .default
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder) }
}
