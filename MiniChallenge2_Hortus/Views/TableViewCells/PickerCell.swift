//
//  PickerCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 23/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class PickerCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerDataDays: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    var pickerData: [String] = ["Horas","Dias","Semanas", "Meses"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return pickerData.count
        }else{
            return pickerDataDays.count
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return pickerData[row]
        }else {
            return pickerDataDays[row]
        }
    }
    
    
    public var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.contentMode = .center
        return picker
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(picker)
        
        picker.delegate = self
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        picker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        picker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        picker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        self.separatorInset = .zero
        self.selectionStyle = .none
              
    }
        
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)}
    
}
