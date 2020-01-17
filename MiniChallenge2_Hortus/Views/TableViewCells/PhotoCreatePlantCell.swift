//
//  PhotoCreatePlantCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 17/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class PhotoCreatePlantCell: UITableViewCell {
    
    var photoInformation: PhotoInformation? {
        didSet{
            photo.image = photoInformation?.plantPhoto
        }
    }
    
    private let photo: UIImageView = {
        let photo = UIImageView(image: #imageLiteral(resourceName: "AddFotoCompleto"))
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    
    private let addPhotoButton: UIButton = {
        let addPhotoButton = UIButton(type: .custom)
        addPhotoButton.setImage(#imageLiteral(resourceName: "Scissor"), for: .normal)
        addPhotoButton.imageView?.contentMode = .scaleAspectFill
        return addPhotoButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(photo)
        addSubview(addPhotoButton)
        
        photo.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        addPhotoButton.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        
        }
        
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
        }
}
