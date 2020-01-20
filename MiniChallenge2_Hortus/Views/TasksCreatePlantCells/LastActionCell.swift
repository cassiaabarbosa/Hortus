//
//  LastActionCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class LastActionCell: UITableViewCell {
    
    var lastActionInformation: LastActionInformation? {
        didSet {
            lastActionLabel.text = lastActionInformation?.lastActionLabel
            //lastAction
        }
    }
    
    public var lastActionLabel: UILabel = {
        let lastActionLabel = UILabel()
        lastActionLabel.textColor = .black
        lastActionLabel.font = UIFont.systemFont(ofSize: 17)
        lastActionLabel.textAlignment = .left
        lastActionLabel.numberOfLines = 0
        return lastActionLabel
    }()
    
    
//    public var plantFrequency: UILabel = {
//        let plantFrequency = UILabel()
//        plantFrequency.textColor = .black
//        plantFrequency.font = UIFont.systemFont(ofSize: 17)
//        plantFrequency.textAlignment = .left
//        plantFrequency.numberOfLines = 0
//        return plantFrequency
//        }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(lastActionLabel)
        //addSubview(plantFrequency)
        
        lastActionLabel.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        lastActionLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)
        
//        plantFrequency.anchor(top: topAnchor, left: frequencyLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)
//        plantFrequency.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
//        
        
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

