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
            lastAction.text = lastActionInformation?.lastAction
            picker = lastActionInformation!.picker
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
    
    
    
    public var lastAction: UILabel = {
        let lastAction = UILabel()
        lastAction.textColor = .black
        lastAction.font = UIFont.systemFont(ofSize: 17)
        lastAction.textAlignment = .left
        lastAction.numberOfLines = 0
        return lastAction
        }()
    
    
    
    public var picker: UIDatePicker = {
        let picker = UIDatePicker()
        return picker
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(lastActionLabel)
        addSubview(lastAction)
        addSubview(picker)
    
        lastActionLabel.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        lastActionLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: frame.size.width/2, height: 0, enableInsets: false)
        
        
        lastAction.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width/2, height: 0, enableInsets: false)
        lastAction.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        
        
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
        
        initView()
        didChangeDate()
   
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func currentDate(date: Date) {
        lastAction.text = date.convertToString(dateformat: .dateWithTime)
        
    }
    
    
    
    func initView() {
        picker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
        
    }
    
    
    
    @objc func datePickerChanged(sender: UIDatePicker) {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        let selectedDate = formatter.string(from: sender.date)
        lastAction.text = selectedDate

    }
    
    
    
    public func didChangeDate() {
        lastAction.text = DateFormatter.localizedString(from: picker.date, dateStyle: .medium, timeStyle: .short)
        
    }

    
}

