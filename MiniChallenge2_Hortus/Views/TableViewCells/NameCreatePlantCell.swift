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
        name.contentMode = .scaleAspectFill
        name.clipsToBounds = true
        name.autocapitalizationType = .words
        name.font = UIFont.systemFont(ofSize: 17)
        name.enablesReturnKeyAutomatically = true
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        let attributedPlaceholder = NSAttributedString(string: "Digite o nome da planta...", attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        name.textAlignment = .center
        name.attributedPlaceholder = attributedPlaceholder
        return name
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(name)
        
        name.delegate = self
        name.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width, height: 50, enableInsets: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
