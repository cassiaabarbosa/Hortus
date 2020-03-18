//
//  FrequencyCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/01/20.
//  Copyright ©️ 2020 Hortus. All rights reserved.
//

import UIKit

class FrequencyCell: UITableViewCell {
    
    
    var frequencyLabel: UILabel = {
        let frequencyLabel = UILabel()
        frequencyLabel.textColor = .black
        frequencyLabel.font = UIFont.systemFont(ofSize: 17)
        frequencyLabel.textAlignment = .left
        frequencyLabel.numberOfLines = 0
        return frequencyLabel
    }()
    
    var frequency: UILabel = {
        let frequency = UILabel()
        frequency.textColor = .black
        frequency.font = UIFont.systemFont(ofSize: 17)
        frequency.textAlignment = .left
        frequency.numberOfLines = 0
        return frequency
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(frequencyLabel)
        contentView.addSubview(frequency)
    
        frequencyLabel.translatesAutoresizingMaskIntoConstraints = false
        frequency.translatesAutoresizingMaskIntoConstraints = false
        
        frequencyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        frequencyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        frequencyLabel.widthAnchor.constraint(equalToConstant: 175).isActive = true
        
        frequency.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        frequency.leadingAnchor.constraint(equalTo: frequencyLabel.trailingAnchor, constant: 10).isActive = true
        frequency.widthAnchor.constraint(equalToConstant: 175).isActive = true
        
        self.separatorInset = .zero
        self.selectionStyle = .default
        
    }
    
    func setDefaultLabel(text: String) {
        frequencyLabel.text = text
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    }
}
