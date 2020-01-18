//
//  NameCreatePlantCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 17/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class NameCreatePlantCell : UITableViewCell, UITextFieldDelegate {
    
     var name: UITextField = {
        let name = UITextField()
        name.text = ""
        name.placeholder = "MEU CCU"
        name.contentMode = .scaleAspectFill
        name.clipsToBounds = true
        name.autocapitalizationType = .words
        name.font = UIFont.systemFont(ofSize: 17)
        return name
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(name)
        
        name.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 100, height: 10, enableInsets: false)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
