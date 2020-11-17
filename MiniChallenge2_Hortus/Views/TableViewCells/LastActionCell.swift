//
//  LastActionCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class LastActionCell: UITableViewCell {
    //MARK: Declarations
	@TemplateView private var lastActionLabel: UILabel
	@TemplateView private var lastActionDate: UIDatePicker
	
	//MARK: Init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupCellAttributes()
		setupLastActionLabelAttributes()
		setupLastActionLabelConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	//MARK: Setup Cell Attributes
	private func setupCellAttributes() {
		self.separatorInset = .zero
		self.selectionStyle = .default
	}
	
	//MARK: Setup LastActionLabel Attributes
	private func setupLastActionLabelAttributes() {
		contentView.addSubview(lastActionLabel)
		lastActionLabel.textColor = .black
		lastActionLabel.font = UIFont.systemFont(ofSize: 17)
		lastActionLabel.textAlignment = .left
		lastActionLabel.numberOfLines = 0
	}
	
	//MARK: Setup LastActionLabel Constraints
	private func setupLastActionLabelConstraints() {
		NSLayoutConstraint.activate([
			lastActionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
			lastActionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			lastActionLabel.widthAnchor.constraint(equalToConstant: 175)
		])
	}
	
//	//MARK: Setup Cell Attributes
//	private func setupCellAttributes() {
//		self.separatorInset = .zero
//		self.selectionStyle = .default
//	}
//	
//	//MARK: Setup LastActionLabel Attributes
//	private func setupLastActionLabelAttributes() {
//		contentView.addSubview(lastActionLabel)
//		lastActionLabel.textColor = .black
//		lastActionLabel.font = UIFont.systemFont(ofSize: 17)
//		lastActionLabel.textAlignment = .left
//		lastActionLabel.numberOfLines = 0
//	}
//	
//	//MARK: Setup LastActionLabel Constraints
//	private func setupLastActionLabelConstraints() {
//		NSLayoutConstraint.activate([
//			lastActionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
//			lastActionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
//			lastActionLabel.widthAnchor.constraint(equalToConstant: 175)
//		])
//	}
	
	func setDefaultLabel(text: String) {
		lastActionLabel.text = text
	}

	@objc func datePickerChanged(sender: UIDatePicker) {
		let formatter: DateFormatter = DateFormatter()
		formatter.dateStyle = .medium
		formatter.timeStyle = .short
	}
}
