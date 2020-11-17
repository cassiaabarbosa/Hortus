//
//  Footer.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 16/11/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

final class Footer: UITableViewHeaderFooterView {
	@TemplateView private var submit: UIButton
	
	static var id: String {
		return String(describing: self)
	}
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		setUpConstrains ()
		setupAttributes()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setUpConstrains () {
		contentView.addSubview(submit)
		NSLayoutConstraint.activate([
			submit.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			submit.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			submit.heightAnchor.constraint(equalToConstant: 45),
			submit.widthAnchor.constraint(equalToConstant: 100)
		])
	}
	
	func setupAttributes() {
		submit.setTitle("Submit", for: .normal)
		submit.setTitleColor(.black, for: .normal)
		self.contentView.backgroundColor = .white
	}
}
