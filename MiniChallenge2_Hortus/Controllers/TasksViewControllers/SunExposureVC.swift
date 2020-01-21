//
//  SunExposureVC.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 20/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Photos

class SunExposureVC : UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UINavigationControllerDelegate {
    
    let frequencyCellId: String = "frequencyCellId"
    let lastActionCellId: String = "lastActionCellid"
    let datePickerViewCellId: String = "datePickerViewCellId"
    var dataFlowering = Array<Any>()
    var lastActionArray = [LastActionInformation]()
    var frequencyArray = [FrequencyInformation]()
    var datePicker =  UIDatePicker()
    var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        
        self.title = "Exposição solar"
        navigationController?.navigationBar.barTintColor = UIColor.App.navigation
        navigationController?.navigationBar.tintColor = UIColor.App.modalButton
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.App.navigationTitle]
        navigationController?.navigationBar.isTranslucent = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .lightGray
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        
        createTableView()
        
        tableView.register(FrequencyCell.self, forCellReuseIdentifier: frequencyCellId)
        tableView.register(LastActionCell.self, forCellReuseIdentifier: lastActionCellId)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                    if let frequencyInformation = frequencyArray[indexPath.row] as? FrequencyInformation {
                        cell.frequencyInformation = frequencyInformation
                        return cell
                    }
                }
        } else if indexPath.section == 1{
                if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                    if let lastActionInformation = lastActionArray[indexPath.row] as? LastActionInformation {
                        cell.lastActionInformation = lastActionInformation
                        return cell
                    }
                }
        }
        
        return UITableViewCell()
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 1
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let sectionName: String
        switch section {
            case 0:
                sectionName =  " "
            default:
                sectionName = " "
        }
        return sectionName
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30.0
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.lightGray
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    func createTableView() {
        //frequencyArray.append(FrequencyInformation(frequencyLabel: "Período de rega", plantFrequency: ""))
        
        //lastActionArray.append(LastActionInformation(lastActionLabel: "Última rega", lastAction: ""))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        1
    }

}
