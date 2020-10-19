//
//  TemplateView.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 15/10/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import Foundation
import UIKit

@propertyWrapper final class TemplateView<View: UIView> {
	
	private lazy var view: View = {
		let view = View(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	var wrappedValue: View {
		return view
	}
}
