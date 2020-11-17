//
//  NameCreatePlantCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 17/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class NameCreatePlantCell : UITableViewCell, UITextFieldDelegate {
	//MARK: Declarations
	@TemplateView private var name: UITextField

	//MARK: Init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupCellAttributes()
		setupNameConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	//MARK: Setup Cell Attributes
	private func setupCellAttributes() {
		contentView.addSubview(name)
		name.delegate = self
		self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
		self.selectionStyle = .default
	}
	
	//MARK: Setup Name Constraints
	private func setupNameConstraints() {
		name.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
		name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
		name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
		name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
