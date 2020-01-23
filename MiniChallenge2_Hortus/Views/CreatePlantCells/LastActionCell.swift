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
    
    
    
    public var picker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(lastActionLabel)
        addSubview(picker)
    
        lastActionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
       lastActionLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
//        lastAction.anchor(top: topAnchor, left: nil, bottom: nil , right: rightAnchor, paddingTop: 25, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, enableInsets: false)
//
//        lastAction.textAlignment = .right
        
        picker.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        picker.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 245, height: 100 , enableInsets: false)
        
        
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        
        self.layoutMargins = UIEdgeInsets.zero
        
        self.selectionStyle = .none
        
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
        picker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
        
    }
    
    
    
    @objc func datePickerChanged(sender: UIDatePicker) {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        let selectedDate = formatter.string(from: sender.date)
        //lastAction.text = selectedDate

    }
    
    
    
    public func didChangeDate() {
//        lastAction.text = DateFormatter.localizedString(from: picker.date, dateStyle: .medium, timeStyle: .short)
        
    }

    
}

