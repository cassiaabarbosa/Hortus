//
//  CustomLabel.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 13/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    var string: String!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setLayout() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

    }
    
    func setProperities(text: String, textAlignment: NSTextAlignment, color: UIColor, numberOfLines: Int) {
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: 17)
        self.textColor = color
    }
    
}
