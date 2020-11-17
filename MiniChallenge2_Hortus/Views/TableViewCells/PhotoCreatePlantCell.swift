//
//  PhotoCreatePlantCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 17/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class PhotoCreatePlantCell: UITableViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    //MARK: Declarations
    @TemplateView private var photo: UIImageView

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupCellAttributes()
		setupPhotoAttributes()
		setupPhotoConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
	}
	
	//MARK: Setup Cell Attributes
	private func setupCellAttributes() {
		self.separatorInset = .zero
		self.selectionStyle = .default
	}
	
	//MARK: Setup Photo Attributes
	private func setupPhotoAttributes() {
		contentView.addSubview(photo)
		photo.image = UIImage(named: "AddPhotoImage")
		photo.contentMode = .scaleToFill
	}
	
	//MARK: Setup Photo Constraints
	private func setupPhotoConstraints() {
		NSLayoutConstraint.activate([
			photo.topAnchor.constraint(equalTo: self.topAnchor),
			photo.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			photo.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			photo.trailingAnchor.constraint(equalTo: self.trailingAnchor)
		])
	}
	
}
