//
//  Coordinator.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/10/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
	var navigationController: UINavigationController { get set }
	
	func show(viewController: UIViewController?)
}
