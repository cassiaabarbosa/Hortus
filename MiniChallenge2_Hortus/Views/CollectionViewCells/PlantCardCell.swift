//
//  PlantCardCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 14/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//

import UIKit
import CoreData

final class PlantCardCell: UICollectionViewCell {
	
	// MARK: Declarations
	@TemplateView var namePlant: UILabel
	@TemplateView var plantImage: UIImageView
	
	static var id: String {
	   return String(describing: self)
	}
	
//    var plantIndex:Int?
//	var plant: Plant?
   
	
	// MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
		setupCellAttributes()
		setupPlantImageAttributes()
		setupPlantNameAttributes()
		setupSubviewsConstraints()
    }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Content Attributes
	private func setupPlantNameAttributes() {
		self.addSubview(namePlant)
		self.namePlant.font = UIFont.systemFont(ofSize: 17)
		self.namePlant.textColor = #colorLiteral(red: 0.5336075425, green: 0.7177075744, blue: 0.4416005611, alpha: 1)
		self.namePlant.textAlignment = .center
		self.namePlant.backgroundColor = UIColor.white
		self.namePlant.translatesAutoresizingMaskIntoConstraints = false
		self.namePlant.layer.cornerRadius = 20
		self.namePlant.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
		self.namePlant.layer.masksToBounds = true
	}

	private func setupPlantImageAttributes() {
		self.addSubview(plantImage)
		self.plantImage.contentMode = .scaleAspectFill
		self.plantImage.translatesAutoresizingMaskIntoConstraints = false
		self.plantImage.layer.cornerRadius = 20
		self.plantImage.layer.masksToBounds = true
		self.plantImage.backgroundColor = .systemPink
	}
	
	private func setupCellAttributes() {
		backgroundColor = .none
		self.layer.masksToBounds = false
		self.layer.shadowColor = UIColor.lightGray.cgColor
		self.layer.shadowOffset = CGSize(width: 4, height: 4)
		self.layer.shadowRadius = 2.0
		self.layer.shadowOpacity = 1
		self.layer.cornerRadius = 20
	}
	
	// MARK: Constraints
	private func setupSubviewsConstraints() {
		NSLayoutConstraint.activate([
			plantImage.topAnchor.constraint(equalTo: self.topAnchor),
			plantImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			plantImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			plantImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),

			namePlant.bottomAnchor.constraint(equalTo: self.plantImage.bottomAnchor),
			namePlant.leadingAnchor.constraint(equalTo: self.plantImage.leadingAnchor),
			namePlant.trailingAnchor.constraint(equalTo: self.plantImage.trailingAnchor),
			namePlant.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	//MARK: Calling Functions
	internal func changeCell(name: String) {
		self.namePlant.text = name
	}
	
	internal func changeCell(image: String) {
		self.plantImage.image = UIImage(named: image)
	}
	
}
