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
        
        self.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    
    func setProperities(text: String, textAlignment: NSTextAlignment, color: UIColor, numberOfLines: Int) {
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: 17)
        self.textColor = color
    }
    
}
