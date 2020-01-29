//
//  CreatePlantView.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 28/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CreatePlantView: UIView {
    
    var table = UITableView(frame: .zero)
    var createPlantViewTableHandler: CreatePlantViewTableHandler?
    
    let nameCellId: String = "nameCellId"
    let photoCellId: String = "photoCellid"
    let taskCellId: String = "taskCellId"
    let frequencyCellId: String = "frequencyCellId"
    let lastActionCellId: String = "lastActionCellId"
    let customHeaderCellId: String = "customHeaderCellId"
    let pickerCellId: String = "pickerCellId"
    let datePickerCellId: String = "datePickerCellId"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        createPlantViewTableHandler = CreatePlantViewTableHandler()
        createPlantViewTableHandler?.parentVC = self
        
        set()
        
        table.delegate = createPlantViewTableHandler
        table.dataSource = createPlantViewTableHandler
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func set() {
        
        table.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: customHeaderCellId)
        table.register(PhotoCreatePlantCell.self, forCellReuseIdentifier: photoCellId)
        table.register(NameCreatePlantCell.self, forCellReuseIdentifier: nameCellId)
        table.register(FrequencyCell.self, forCellReuseIdentifier: frequencyCellId)
        table.register(PickerCell.self, forCellReuseIdentifier: pickerCellId)
        table.register(LastActionCell.self, forCellReuseIdentifier: lastActionCellId)
        table.register(DatePickerCell.self, forCellReuseIdentifier: datePickerCellId)
        
        self.addSubview(table)
        
        self.table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }
    
    
}
