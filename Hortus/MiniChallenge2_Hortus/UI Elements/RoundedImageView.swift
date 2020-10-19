//
//  RoundedImageView.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 24/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 25
    }
    
}
