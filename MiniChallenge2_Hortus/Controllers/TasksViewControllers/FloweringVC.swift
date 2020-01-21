//
//  FloweringVC.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 19/01/20.
//  Copyright ©️ 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Photos

class FloweringVC : UITableViewController, UIPickerViewDelegate, UITextFieldDelegate, UINavigationControllerDelegate, DatePickerDelegate {
    
    let frequencyCellId: String = "frequencyCellId"
    let lastActionCellId: String = "lastActionCellid"
    let datePickerViewCellId: String = "datePickerViewCellId"
    var data = Array<Any>()
    var inputDates: [Date] = []
    var inputTexts: [String] = []
    var datePicker =  UIDatePicker()
    var picker = UIPickerView()
    var datePickerIndexPath: IndexPath?
    
    
    
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
        
        addInitailValues()
        createTableView()
        
        tableView.register(FrequencyCell.self, forCellReuseIdentifier: frequencyCellId)
        tableView.register(LastActionCell.self, forCellReuseIdentifier: lastActionCellId)
        tableView.register(DatePickerViewCell.self, forCellReuseIdentifier: datePickerViewCellId)
        
    }
    
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    
    
    func addInitailValues() {
        inputDates = Array(repeating: Date(), count: 2)
        
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.lightGray
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if datePickerIndexPath != nil {
            return data.count + 1
        } else {
            return data.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if datePickerIndexPath == indexPath {
            if let cell  = tableView.dequeueReusableCell(withIdentifier: datePickerViewCellId) as? DatePickerViewCell {
                cell.updateCell(date: inputDates[indexPath.row - 1], indexPath: indexPath)
                cell.delegate = self
                return cell
            }
        }else{
            if (data[indexPath.row] is FrequencyInformation) {
                if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                    if let frequencyInformation = data[indexPath.row] as? FrequencyInformation {
                        cell.frequencyInformation = frequencyInformation
                         cell.updateText(date: inputDates[indexPath.row])
                        return cell
                    }
                }
            } else{
                if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                    if indexPath.row < data.count {
                        if let lastActionInformation = data[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
                            cell.updateText(date: inputDates[indexPath.row])
                            return cell
                        }
                    }
                }
            }
        }
        return UITableViewCell()
    }
        
    
    func indexPathToInsertDatePicker(indexPath: IndexPath) -> IndexPath {
        if let datePickerIndexPath = datePickerIndexPath, datePickerIndexPath.row < indexPath.row {
            return indexPath
        } else {
            return IndexPath(row: indexPath.row + 1, section: indexPath.section)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        if let datePickerIndexPath = datePickerIndexPath, datePickerIndexPath.row - 1 == indexPath.row {
            tableView.deleteRows(at: [datePickerIndexPath], with: .fade)
            self.datePickerIndexPath = nil
        } else {
            if let datePickerIndexPath = datePickerIndexPath {
                tableView.deleteRows(at: [datePickerIndexPath], with: .fade)
            }
            datePickerIndexPath = indexPathToInsertDatePicker(indexPath: indexPath)
            tableView.insertRows(at: [datePickerIndexPath!], with: .fade)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        tableView.endUpdates()
    }
    

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30.0
    }
    

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func createTableView() {
        data.append(FrequencyInformation(frequencyLabel: "Período de rega", plantFrequency: " "))
        
        data.append(LastActionInformation(lastActionLabel: "Última rega", lastAction: " "))
        
    }
    
    
    func didChangeDate(date: Date, indexPath: IndexPath) {
        inputDates[indexPath.row] = date
        tableView.reloadRows(at: [indexPath], with: .none)
    }


}
