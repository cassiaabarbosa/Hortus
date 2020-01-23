//
//  PickerViewCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 20/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

protocol PickerDelegate: class {
    func didChangeDate(date: Date, indexPath: IndexPath)
}

class PickerViewCell: UITableViewCell {
    
    var picker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    var indexPath: IndexPath!
    var delegate: PickerDelegate?
    let section1:[String] = ["dias", "meses", "anos"]
    let section2:[String] = ["1", "2", "3","4"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(picker)
        
        picker.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.size.width, height: frame.size.width, enableInsets: false)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //initView()

    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return 2
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numero[row]

    }
    
//    func initView() {
//        picker.addTarget(self, action: #selector(dateDidChange), for: .valueChanged)
//    }
//
//    func updateCell(indexPath: IndexPath) {
//        picker.
//        self.indexPath = indexPath
//    }
//
//    @objc func dateDidChange(_ sender: UIDatePicker) {
//        let indexPathForDisplayDate = IndexPath(row: indexPath.row - 1, section: indexPath.section)
//        delegate?.didChangeDate(date: sender.date, indexPath: indexPathForDisplayDate)
//    }
//
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
