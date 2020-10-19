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
        var name = UITextField()
        name.placeholder = "Digite o nome da planta"
        name.font = UIFont.systemFont(ofSize: 17)
        name.textAlignment = .center
        return name
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(name)
        
        
        name.delegate = self
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        self.selectionStyle = .default
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    }
}
