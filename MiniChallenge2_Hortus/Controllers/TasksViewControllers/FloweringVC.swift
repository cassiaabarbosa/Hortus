//
//  FloweringVC.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Photos

class FloweringVC : UITableViewController, UIPickerViewDelegate, UITextFieldDelegate, UINavigationControllerDelegate {
    
    let frequencyCellId: String = "frequencyCellId"
    let lastActionCellId: String = "lastActionCellid"
    let datePickerViewCellId: String = "datePickerViewCellId"
    var lastActionArray = [LastActionInformation]()
    var frequencyArray = [FrequencyInformation]()
    var datePickerArray = [DatePickerInformation]()
    public var inputDates: [Date] = []
    var datePicker =  UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        
        self.title = "Floração"
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
        tableView.register(DatePickerViewCell.self, forCellReuseIdentifier: datePickerViewCellId)
        
        
//        func indexPathToInsertDatePicker(indexPath: IndexPath) -> IndexPath {
//            if let datePickerIndexPath = datePickerIndexPath, datePickerIndexPath.row < indexPath.row {
//                return indexPath
//            } else {
//                return IndexPath(row: indexPath.row + 1, section: indexPath.section)
//            }
//        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                    if let frequencyInformation = frequencyArray[indexPath.row] as? FrequencyInformation {
                        cell.frequencyInformation = frequencyInformation
                        return cell
                    }
                }
                
                if let cell  = tableView.dequeueReusableCell(withIdentifier: datePickerViewCellId) as? DatePickerViewCell {
                        //cell.updateCell(date: inputDates[indexPath.row - 1], indexPath: indexPath)
                        return cell
                    }
        
        return UITableViewCell()
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
               return 2
        }
        else if section == 1 {
            return 2
            
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
        frequencyArray.append(FrequencyInformation(frequencyLabel: "Período de rega", plantFrequency: "00/00/00"))
        
        lastActionArray.append(LastActionInformation(lastActionLabel: "Última rega", lastAction: "00/00/00"))
        
        datePickerArray.append(DatePickerInformation(datePickerLabel: ""))
    }
    
    
    
    func didChangeDate(date: Date, indexPath: IndexPath) {
        inputDates[indexPath.row] = date
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
//    func indexPathToInsertDatePicker(indexPath: IndexPath) -> IndexPath {
//        if let datePickerIndexPath = datePickerIndexPath, datePickerIndexPath.row < indexPath.row {
//            return indexPath
//        } else {
//            return IndexPath(row: indexPath.row + 1, section: indexPath.section)
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if datePickerIndexPath == indexPath {
//            return 162
//        } else {
//            return 50
//        }
//    }



}

