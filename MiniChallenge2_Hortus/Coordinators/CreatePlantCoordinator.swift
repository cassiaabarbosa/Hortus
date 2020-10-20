//
//  CreatePlantCoordinator.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/10/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit

final class CreatePlantCoordinator: Coordinator {
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func show(viewController: UIViewController?) {
		let viewModel = CreatePlantViewModel()
		let vc = CreatePlantVC(viewModel: viewModel)
		let navController = UINavigationController(rootViewController: vc)
		viewController?.present(navController, animated: true)
	}
	
}
