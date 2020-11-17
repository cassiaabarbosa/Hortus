//
//  InitialCoordinator.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/10/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit

struct InitialCoordinator {
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func show() {
		let viewModel = GardenViewModel()
		let vc = GardenVC(viewModel: viewModel)
		navigationController.pushViewController(vc, animated: true)
	}
}
