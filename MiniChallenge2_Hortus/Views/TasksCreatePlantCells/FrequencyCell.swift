//
//  FrequencyCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit


class FrequencyCell: UITableViewCell {
    
    var frequencyInformation: FrequencyInformation? {
        didSet {
            frequencyLabel.text = frequencyInformation?.frequencyLabel
            plantFrequency.text = frequencyInformation?.plantFrequency
        }
    }
    
    public var frequencyLabel: UILabel = {
        let frequencyLabel = UILabel()
        frequencyLabel.textColor = .black
        frequencyLabel.font = UIFont.systemFont(ofSize: 17)
        frequencyLabel.textAlignment = .left
        frequencyLabel.numberOfLines = 0
        return frequencyLabel
    }()
    
    
    public var plantFrequency: UILabel = {
        let plantFrequency = UILabel()
        plantFrequency.textColor = .black
        plantFrequency.font = UIFont.systemFont(ofSize: 17)
        plantFrequency.textAlignment = .left
        plantFrequency.numberOfLines = 0
        return plantFrequency
        }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(frequencyLabel)
        addSubview(plantFrequency)
        
        frequencyLabel.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        frequencyLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: frame.size.width , height: 0, enableInsets: false)
        
        plantFrequency.anchor(top: topAnchor, left: frequencyLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)
        plantFrequency.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        
        
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateText(date: Date) {
        //plantFrequency.text =  date.convertToString(dateformat: .dateWithTime)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
