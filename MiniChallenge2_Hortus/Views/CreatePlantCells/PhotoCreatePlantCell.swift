//
//  PhotoCreatePlantCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 17/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class PhotoCreatePlantCell: UITableViewCell, UIImagePickerControllerDelegate {
    
    var photoInformation: PhotoInformation? {
        didSet {
            photo.image = photoInformation?.plantPhoto
        }
    }
    
    
    public var photo: UIImageView = {
        let photo = UIImageView(image: #imageLiteral(resourceName: "AddFotoCompleto"))
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.backgroundColor = .black
        return photo
    }()
    
    
    public var addPhotoButton: UIButton = {
        let addPhotoButton = UIButton(type: UIButton.ButtonType.custom)
        addPhotoButton.setImage(UIImage(named: "AddPhotoButton"), for: .normal)
        
        return addPhotoButton
    }()
    
    
    var addPhotoButtonClickedClosure : (()->Void)?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(photo)
        addSubview(addPhotoButton)
        
        
        photo.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        addPhotoButton.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        addPhotoButton.addTarget(self, action: #selector(addPhotoButtonClicked(_:)), for: .touchUpInside)
        
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
        self.selectionStyle = .none
        }
    
    @IBAction func addPhotoButtonClicked(_ sender: UIButton) {
        addPhotoButtonClickedClosure?()
        
    }
    
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
        }
}
