//
//  DatePickerCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 23/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class DatePickerCell: UITableViewCell {
    
    var datePickerInformation: DatePickerInformation? {
        didSet {
            datePicker = datePickerInformation!.datePicker
        }
    }
    
    
    
    public var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(datePicker)
        
        datePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        datePicker.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 245, height: 0, enableInsets: true)
        
        self.separatorInset = .zero
        
        self.layoutMargins = UIEdgeInsets.zero
        
        self.selectionStyle = .none
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
