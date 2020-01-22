//
//  FertilizationVC.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 20/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FertilizingVC : UITableViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    let frequencyCellId: String = "frequencyCellId"
    let lastActionCellId: String = "lastActionCellid"
    var data = Array<Any>()
    var inputDates: [Date] = []
    var inputTexts: [String] = []
    var picker = UIPickerView()
    var datePicker = UIDatePicker()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        
        self.title = "Fertilizantes"
        navigationController?.navigationBar.barTintColor = UIColor.App.navigation
        navigationController?.navigationBar.tintColor = UIColor.App.modalButton
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.App.navigationTitle]
        navigationController?.navigationBar.isTranslucent = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .lightGray
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        addInitailValue()
        createTableView()
        
        tableView.register(FrequencyCell.self, forCellReuseIdentifier: frequencyCellId)
        tableView.register(LastActionCell.self, forCellReuseIdentifier: lastActionCellId)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (data[indexPath.row] is FrequencyInformation) {
                if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                    if let frequencyInformation = data[indexPath.row] as? FrequencyInformation {
                        cell.frequencyInformation = frequencyInformation
                        return cell
                    }
                }
            } else{
                if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                    if indexPath.row < data.count {
                        if let lastActionInformation = data[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
                            cell.currentDate(date: inputDates[0])
                            datePicker = cell.picker
                            return cell
                        }
                    }
                }
            }
        return UITableViewCell()
    }
    
    
    func addInitailValue() {
        inputDates.append(Date())
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        
        }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.tableView.indexPathForSelectedRow?.row == indexPath.row {
            return 150;
        } else {
        return 50;
        }
    }
    
    

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    func createTableView() {
        data.append(FrequencyInformation(frequencyLabel: "Período de rega", plantFrequency: " ", picker: picker))
        
        data.append(LastActionInformation(lastActionLabel: "Última rega", lastAction: "", picker: datePicker))
    }
    
}
