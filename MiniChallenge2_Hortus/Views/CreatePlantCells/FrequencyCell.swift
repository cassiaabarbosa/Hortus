//
//  FrequencyCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/01/20.
//  Copyright ©️ 2020 Hortus. All rights reserved.
//

//
//  FrequencyCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/01/20.
//  Copyright ©️ 2020 Hortus. All rights reserved.
//

import UIKit


class FrequencyCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerDataDays: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    var pickerData: [String] = ["Horas","Dias","Meses"]
    var labelText: [String] = ["", ""]
    
    
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
    
    
    var frequencyInformation: FrequencyInformation? {
        didSet {
            frequencyLabel.text = frequencyInformation?.frequencyLabel

            labelText[0] = pickerDataDays[0]
            labelText[1] = pickerData[0]
//            plantFrequency.text = "\(labelText[0])   \(labelText[1])"
            picker = frequencyInformation!.picker
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
    
    
    
    public var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.contentMode = .center
        return picker
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(frequencyLabel)
        addSubview(picker)
        
        picker.delegate = self
    
        frequencyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        frequencyLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        picker.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        picker.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 245, height: 100, enableInsets: true)
        
        
        self.separatorInset = .zero
        self.selectionStyle = .none
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if component == 0 {
//            labelText[0] = pickerDataDays[row]
//        } else {
//            labelText[1] = pickerData[row]
//        }
//        plantFrequency.text = "\(labelText[0])  \(labelText[1])"
    }
}
