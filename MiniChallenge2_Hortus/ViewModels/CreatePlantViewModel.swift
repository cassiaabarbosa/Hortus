//
//  CreatePlantViewModel.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 15/10/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import CoreData

struct CreatePlantViewModel {
	
//	var plant = Plant()
	
	private let titleForSection: [(String,String)] = [("","vazio"), ("Floração","BlackFlower"), ("Colheita","BlackHarvest"), ("Exposição Solar","BlackSun"), ("Fertilizantes","BlackBooster"), ("Rega","BlackDrop"), ("Poda","BlackScissor"), ("Pesticidas","BlackPesticide")]

	
	func getNumberOfSections() -> Int {
		return 8
	}
	
	func getTitle(for section: Int) -> (String,String) {
		return titleForSection[section]
	}
	
}
