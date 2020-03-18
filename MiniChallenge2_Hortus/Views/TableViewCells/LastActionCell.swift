//
//  LastActionCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class LastActionCell: UITableViewCell {
    
    
    let lastActionLabel: UILabel = {
        let lastActionLabel = UILabel()
        lastActionLabel.textColor = .black
        lastActionLabel.font = UIFont.systemFont(ofSize: 17)
        lastActionLabel.textAlignment = .left
        lastActionLabel.numberOfLines = 0
        return lastActionLabel
    }()
    
    
    let lastAction: UILabel = {
        let lastAction = UILabel()
        lastAction.textColor = .black
        lastAction.font = UIFont.systemFont(ofSize: 17)
        lastAction.textAlignment = .left
        lastAction.numberOfLines = 0
        return lastAction
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(lastActionLabel)
        self.addSubview(lastAction)
        
            lastActionLabel.translatesAutoresizingMaskIntoConstraints = false
            lastAction.translatesAutoresizingMaskIntoConstraints = false
            
            lastActionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
            lastActionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
            lastActionLabel.widthAnchor.constraint(equalToConstant: 175).isActive = true
            
            lastAction.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
            lastAction.leadingAnchor.constraint(equalTo: lastActionLabel.trailingAnchor, constant: 10).isActive = true
            lastAction.widthAnchor.constraint(equalToConstant: 175).isActive = true
        self.separatorInset = .zero
        self.selectionStyle = .default
   
    }
    
    
    func setDefaultLabel(text: String) {
        lastActionLabel.text = text
    }
    
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    }
    
    @objc func datePickerChanged(sender: UIDatePicker) {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
    }
    
}
