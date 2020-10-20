//
//  CustomHeader.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 23/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit

final class CustomHeader: UITableViewHeaderFooterView {
	
	// MARK: Declarations
	@TemplateView private var image: UIImageView
	@TemplateView private var title: UILabel
	
	static var id: String {
		return String(describing: self)
	}
	
	// MARK: Init
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		setupImageConstraints()
		setupTitleConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: Setup Image Constraints
	func setupImageConstraints() {
		contentView.addSubview(image)
		NSLayoutConstraint.activate([
			image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			image.widthAnchor.constraint(equalToConstant: 30),
			image.heightAnchor.constraint(equalToConstant: 30),
			image.bottomAnchor.constraint(equalTo:contentView.bottomAnchor)
		])
	}
	
	// MARK: Setup Title Constraints
	func setupTitleConstraints() {
		contentView.addSubview(title)
		NSLayoutConstraint.activate([
			title.heightAnchor.constraint(equalToConstant: 30),
			title.leadingAnchor.constraint(equalTo: image.trailingAnchor,
										   constant: 5),
			title.bottomAnchor.constraint(equalTo:contentView.bottomAnchor)
		])
	}
	
	// MARK: Setup Header Image
	func setHeaderImage(name: String) {
		image.image = UIImage(named: name)
	}
	
	// MARK: Setup Header Title
	func setHeaderTitle(text: String) {
		title.text = text
	}
}
