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
	@TemplateView private var title: UILabel
	
	static var id: String {
		return String(describing: self)
	}
	
	// MARK: Init
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		setupTitleConstraints()
		self.contentView.backgroundColor = .white
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Setup Title Constraints
	private func setupTitleConstraints() {
		contentView.addSubview(title)
		NSLayoutConstraint.activate([
			title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
			title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			title.bottomAnchor.constraint(equalTo:contentView.bottomAnchor),
			title.topAnchor.constraint(equalTo:contentView.topAnchor)
		])
	}
	
	
	// MARK: Setup Header Title
	func setHeaderTitle(text: String) {
		title.text = text
	}
}
