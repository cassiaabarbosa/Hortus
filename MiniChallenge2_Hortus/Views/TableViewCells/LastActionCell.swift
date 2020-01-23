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
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(lastActionLabel)

       lastActionLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        self.separatorInset = .zero
        self.selectionStyle = .default
        
        initView()
        didChangeDate()
   
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func currentDate(date: Date) {
//        lastAction.text = date.convertToString(dateformat: .dateWithTime)
        
    }
    
    
    
    func initView() {
//        picker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
        
    }
    
    
    
    @objc func datePickerChanged(sender: UIDatePicker) {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
//        let selectedDate = formatter.string(from: sender.date)
        //lastAction.text = selectedDate

    }
    
    
    
    public func didChangeDate() {
//        lastAction.text = DateFormatter.localizedString(from: picker.date, dateStyle: .medium, timeStyle: .short)
        
    }

    
}

