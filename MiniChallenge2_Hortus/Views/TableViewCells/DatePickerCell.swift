//
//  DatePickerCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 23/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class DatePickerCell: UITableViewCell {
    
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(datePicker)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        self.separatorInset = .zero
        self.layoutMargins = UIEdgeInsets.zero
        self.selectionStyle = .none
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    }
}
