//
//  ActionButton.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 25/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class ActionButton: UIButton {
    
    var value: Int = 0
    weak var delegate: PlantTasksViewDelegate?
    
     override init(frame: CGRect) {
           super.init(frame: frame)
           self.addTarget(self, action: #selector(didSelect), for: .touchUpInside)
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }

       @objc func didSelect() {
           delegate?.didSelect(value: value)
       }
    
    
}
