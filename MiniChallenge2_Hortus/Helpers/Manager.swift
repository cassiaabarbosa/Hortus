//
//  Manager.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 29/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation

public class HortusSingleton {
    
    var photo = 7
    static let shared = HortusSingleton()
    
    private init(){}

}
