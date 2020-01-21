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

class FloweringVC : UITableViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    let frequencyCellId: String = "frequencyCellId"
    let lastActionCellId: String = "lastActionCellid"
    let datePickerViewCellId: String = "datePickerViewCellId"
    let pickerViewCellId: String = "pickerViewCellId"
    var data = Array<Any>()
    var inputDates: [Date] = []
    var inputTexts: [String] = []
    var picker = UIPickerView()
    var datePicker = UIPickerView()
    
    
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
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        return UITableViewCell()
    }
        
    
//    func indexPathToInsertDatePicker(indexPath: IndexPath) -> IndexPath {
//        if let datePickerIndexPath = datePickerIndexPath, datePickerIndexPath.row < indexPath.row {
//            return indexPath
//        } else {
//            return IndexPath(row: indexPath.row + 1, section: indexPath.section)
//        }
//    }
    
//    func indexPathToInsertPicker(indexPath: IndexPath) -> IndexPath {
////        if let pickerIndexPath = pickerIndexPath, pickerIndexPath.row < indexPath.row {
////            return indexPath
////        } else {
////            return IndexPath(row: indexPath.row + 1, section: indexPath.section)
////        }
//    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
//        if let datePickerIndexPath = datePickerIndexPath, datePickerIndexPath.row - 1 == indexPath.row {
//            tableView.deleteRows(at: [datePickerIndexPath], with: .fade)
//            self.datePickerIndexPath = nil
//        } else {
//            if let datePickerIndexPath = datePickerIndexPath {
//                tableView.deleteRows(at: [datePickerIndexPath], with: .fade)
//            }
//            datePickerIndexPath = indexPathToInsertDatePicker(indexPath: indexPath)
//            tableView.insertRows(at: [datePickerIndexPath!], with: .fade)
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
        tableView.endUpdates()
    }
    

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30.0
    }
    

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func createTableView() {
        data.append(FrequencyInformation(frequencyLabel: "Período de rega", plantFrequency: " ", picker: picker))
        
        data.append(LastActionInformation(lastActionLabel: "Última rega", lastAction: " ", picker: datePicker))
        
    }
    
    
    func didChangeDate(date: Date, indexPath: IndexPath) {
        inputDates[indexPath.row] = date
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300.0
    }


}
