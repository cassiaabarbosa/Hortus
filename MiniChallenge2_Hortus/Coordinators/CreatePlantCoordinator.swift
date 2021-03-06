//
//  CreatePlantCoordinator.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/10/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit

struct CreatePlantCoordinator {
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func show(viewController: UIViewController) {
		let viewModel = CreatePlantViewModel()
		let vc = CreatePlantVC(viewModel: viewModel)
		navigationController.pushViewController(vc, animated: true)
//		navigationController.present(vc, animated: true, completion: nil)
		
	}
}
