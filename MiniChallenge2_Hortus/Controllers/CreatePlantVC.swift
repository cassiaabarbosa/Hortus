//
//  CreatePlantVC.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 14/05/19.
//  Copyright ©️ 2019 Hortus. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Photos

class CreatePlantVC : UITableViewController, UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate {
    
    var context : NSManagedObjectContext?
    
    let nameCellId: String = "nameCellId"
    let photoCellId: String = "photoCellid"
    let taskCellId: String = "taskCellId"
    let frequencyCellId: String = "frequencyCellId"
    let lastActionCellId: String = "lastActionCellId"
    let custonHeaderCellId: String = "customHeaderCellId"
    let pickerCellId: String = "pickerCellId"
    let datePickerCellId: String = "datePickerCellId"
    
    var data = Array<Any>()
    var firstSectionData = Array<Any>()
    var secondSectionData = Array<Any>()
    var thirdSectionData = Array<Any>()
    var fourthSectionData = Array<Any>()
    var fifthSectionData = Array<Any>()
    var sixthSectionData = Array<Any>()
    var seventhSectionData = Array<Any>()
    
    var inputDates: [Date] = []
    var inputTexts: [String] = []
    
    var pickerAddPhotoButton = UIImagePickerController()
    
    var floweringPicker = UIPickerView()
    var floweringDatePicker = UIDatePicker()
    var floweringPickerVisible = false
    var floweringDatePickerVisible = false
    
    var harvestingPicker = UIPickerView()
    var harvestingDatePicker = UIDatePicker()
    var harvestingPickerVisible = false
    var harvestingDatePickerVisible = false
    
    var sunExposurePicker = UIPickerView()
    var sunExposureDatePicker = UIDatePicker()
    var sunExposurePickerVisible = false
    var sunExposureDatePickerVisible = false
    
    var boosterPicker = UIPickerView()
    var boosterDatePicker = UIDatePicker()
    var boosterPickerVisible = false
    var boosterDatePickerVisible = false
    
    var wateringPicker = UIPickerView()
    var wateringDatePicker = UIDatePicker()
    var wateringPickerVisible = false
    var wateringDatePickerVisible = false
    
    var pruningPicker = UIPickerView()
    var pruningDatePicker = UIDatePicker()
    var pruningPickerVisible = false
    var pruningDatePickerVisible = false
    
    var pesticidePicker = UIPickerView()
    var pesticideDatePicker = UIDatePicker()
    var pesticidePickerVisible = false
    var pesticideDatePickerVisible = false
    
    var tableViewCells: [UITableViewCell] = []
    
    var plantName = UITextField()
    var plantImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        
        self.title = "Nova Planta"
        
        navigationController?.navigationBar.barTintColor = UIColor.App.navigation
        navigationController?.navigationBar.tintColor = UIColor.App.modalButton
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.App.navigationTitle]
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Adicionar", style: .done, target: self, action: #selector(doneCreation(_:))), animated: true)
        navigationItem.setLeftBarButton(UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelCreation(_:))), animated: true)
        
        navigationItem.leftBarButtonItem?.tintColor = UIColor.App.delete
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .lightGray
        
        tableView.keyboardDismissMode = .onDrag
        
        plantImage = #imageLiteral(resourceName: "AddPhotoImage")
        
        pickerAddPhotoButton.delegate = self
        
        addInitailValue()
        createTableView()
        
        tableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: custonHeaderCellId)
        tableView.register(PhotoCreatePlantCell.self, forCellReuseIdentifier: photoCellId)
        tableView.register(NameCreatePlantCell.self, forCellReuseIdentifier: nameCellId)
        tableView.register(FrequencyCell.self, forCellReuseIdentifier: frequencyCellId)
        tableView.register(LastActionCell.self, forCellReuseIdentifier: lastActionCellId)
        tableView.register(PickerCell.self, forCellReuseIdentifier: pickerCellId)
        tableView.register(DatePickerCell.self, forCellReuseIdentifier: datePickerCellId)
        

        func textFieldShouldReturn(textField: UITextField) -> Bool {
            
            textField.resignFirstResponder()
            return true
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: - Table View Header
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0
        }
        return 40
    }
    
    
    override func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: custonHeaderCellId) as! CustomHeader
        headerView.title.text = headerView.titleForSection[section]
        headerView.image.image = headerView.imageForSection[section]

       return headerView
    }
    
    
    // MARK: - Set Table View
//    func rowWasTouched(_ sender: UITapGestureRecognizer) {
//        let cell = sender.view as! UITableViewCell
//        let section = cell.tag
//        if (self.expandedSectionHeaderNumber == -1) {
//            self.expandedSectionHeaderNumber = section
//            tableViewExpandSection(section)
//        } else {
//            if (self.expandedSectionHeaderNumber == section) {
//                tableViewCollapeSection(section)
//            } else {
//                tableViewCollapeSection(self.expandedSectionHeaderNumber)
//                tableViewExpandSection(section)
//            }
//        }
//    }
//
    
    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 8
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section != 0{
            return 4
        }
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0{
                if (data[indexPath.row] is PhotoInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: photoCellId) as? PhotoCreatePlantCell {
                        if let photoInformation = data[indexPath.row] as? PhotoInformation {
                            cell.photoInformation = photoInformation
                            cell.addPhotoButtonClickedClosure = {[self] in
                                let alert = UIAlertController(title: "Adicionar foto da Planta", message: nil, preferredStyle: .alert)
                                
                                alert.addAction(UIAlertAction(title: "Câmera", style: .default, handler: { (action) in
                                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                        self.pickerAddPhotoButton.delegate = self
                                        self.pickerAddPhotoButton.sourceType = .camera
                                        self.pickerAddPhotoButton.allowsEditing = false
                                        self.present(self.pickerAddPhotoButton, animated: true, completion: nil)
                                        
                                    }}))
                                
                                alert.addAction(UIAlertAction(title: "Galeria", style: UIAlertAction.Style.default, handler: { (action) in
                                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                                        self.pickerAddPhotoButton.delegate = self
                                        self.pickerAddPhotoButton.sourceType = .photoLibrary
                                        self.pickerAddPhotoButton.allowsEditing = false
                                        self.present(self.pickerAddPhotoButton, animated: true, completion: nil)
                                        
                                    }}))
                                
                                self.present(alert, animated: true) {
                                    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
                                    alert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
                                }
                            }
                            return cell
                        }
                        
                    }
                }
            }else if indexPath.row == 1 {
                if (data[indexPath.row] is NameInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: nameCellId) as? NameCreatePlantCell {
                        return cell
                    }
                }
            }
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {
                if (firstSectionData[indexPath.row] is FrequencyInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                        if let frequencyInformation = firstSectionData[indexPath.row] as? FrequencyInformation {
                            cell.frequencyInformation = frequencyInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 1{
                if (firstSectionData[indexPath.row] is PickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                        if let pickerInformation = firstSectionData[indexPath.row] as? PickerInformation {
                            cell.pickerInformation = pickerInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 2{
                if (firstSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = firstSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
                            return cell
                        }
                    }
                }
                
            }else if indexPath.row == 3{
                if (firstSectionData[indexPath.row] is DatePickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                        if let datePickerInformation = firstSectionData[indexPath.row] as? DatePickerInformation {
                            cell.datePickerInformation = datePickerInformation
                            return cell
                        }
                    }
                }
                
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                if (secondSectionData[indexPath.row] is FrequencyInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                        if let frequencyInformation = secondSectionData[indexPath.row] as? FrequencyInformation {
                            cell.frequencyInformation = frequencyInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 1{
                if (secondSectionData[indexPath.row] is PickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                        if let pickerInformation = secondSectionData[indexPath.row] as? PickerInformation {
                            cell.pickerInformation = pickerInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 2{
                if (secondSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = secondSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
                            return cell
                        }
                    }
                }
                
            }else if indexPath.row == 3{
                if (secondSectionData[indexPath.row] is DatePickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                        if let datePickerInformation = secondSectionData[indexPath.row] as? DatePickerInformation {
                            cell.datePickerInformation = datePickerInformation
                            return cell
                        }
                    }
                }
                
            }
        }else if indexPath.section == 3{
            if indexPath.row == 0 {
                if (thirdSectionData[indexPath.row] is FrequencyInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                        if let frequencyInformation = thirdSectionData[indexPath.row] as? FrequencyInformation {
                            cell.frequencyInformation = frequencyInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 1{
                if (thirdSectionData[indexPath.row] is PickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                        if let pickerInformation = thirdSectionData[indexPath.row] as? PickerInformation {
                            cell.pickerInformation = pickerInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 2{
                if (thirdSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = thirdSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
                            return cell
                        }
                    }
                }
                
            }else if indexPath.row == 3{
                if (thirdSectionData[indexPath.row] is DatePickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                        if let datePickerInformation = thirdSectionData[indexPath.row] as? DatePickerInformation {
                            cell.datePickerInformation = datePickerInformation
                            return cell
                        }
                    }
                }
                
            }
        }else if indexPath.section == 4 {
            if indexPath.row == 0 {
                if (fourthSectionData[indexPath.row] is FrequencyInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                        if let frequencyInformation = fourthSectionData[indexPath.row] as? FrequencyInformation {
                            cell.frequencyInformation = frequencyInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 1{
                if (fourthSectionData[indexPath.row] is PickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                        if let pickerInformation = fourthSectionData[indexPath.row] as? PickerInformation {
                            cell.pickerInformation = pickerInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 2{
                if (fourthSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = fourthSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
                            return cell
                        }
                    }
                }
                
            }else if indexPath.row == 3{
                if (fourthSectionData[indexPath.row] is DatePickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                        if let datePickerInformation = fourthSectionData[indexPath.row] as? DatePickerInformation {
                            cell.datePickerInformation = datePickerInformation
                            return cell
                        }
                    }
                }
                
            }
        }else if indexPath.section == 5 {
            if indexPath.row == 0 {
                if (fifthSectionData[indexPath.row] is FrequencyInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                        if let frequencyInformation = fifthSectionData[indexPath.row] as? FrequencyInformation {
                            cell.frequencyInformation = frequencyInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 1{
                if (fifthSectionData[indexPath.row] is PickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                        if let pickerInformation = fifthSectionData[indexPath.row] as? PickerInformation {
                            cell.pickerInformation = pickerInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 2{
                if (fifthSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = fifthSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
                            return cell
                        }
                    }
                }
                
            }else if indexPath.row == 3{
                if (fifthSectionData[indexPath.row] is DatePickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                        if let datePickerInformation = fifthSectionData[indexPath.row] as? DatePickerInformation {
                            cell.datePickerInformation = datePickerInformation
                            return cell
                        }
                    }
                }
                
            }
        }else if indexPath.section == 6 {
            if indexPath.row == 0 {
                if (sixthSectionData[indexPath.row] is FrequencyInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                        if let frequencyInformation = sixthSectionData[indexPath.row] as? FrequencyInformation {
                            cell.frequencyInformation = frequencyInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 1{
                if (sixthSectionData[indexPath.row] is PickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                        if let pickerInformation = sixthSectionData[indexPath.row] as? PickerInformation {
                            cell.pickerInformation = pickerInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 2{
                if (sixthSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = sixthSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
                            return cell
                        }
                    }
                }
                
            }else if indexPath.row == 3{
                if (sixthSectionData[indexPath.row] is DatePickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                        if let datePickerInformation = sixthSectionData[indexPath.row] as? DatePickerInformation {
                            cell.datePickerInformation = datePickerInformation
                            return cell
                        }
                    }
                }
                
            }
        }else if indexPath.section == 7 {
            if indexPath.row == 0 {
                if (seventhSectionData[indexPath.row] is FrequencyInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                        if let frequencyInformation = seventhSectionData[indexPath.row] as? FrequencyInformation {
                            cell.frequencyInformation = frequencyInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 1{
                if (seventhSectionData[indexPath.row] is PickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                        if let pickerInformation = seventhSectionData[indexPath.row] as? PickerInformation {
                            cell.pickerInformation = pickerInformation
                            return cell
                        }
                    }
                }
            }else if indexPath.row == 2{
                if (seventhSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = seventhSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
                            return cell
                        }
                    }
                }
                
            }else if indexPath.row == 3{
                if (seventhSectionData[indexPath.row] is DatePickerInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                        if let datePickerInformation = seventhSectionData[indexPath.row] as? DatePickerInformation {
                            cell.datePickerInformation = datePickerInformation
                            return cell
                        }
                    }
                }
                
            }
        }
        return UITableViewCell()
    }
    
//    MARK: - TableView Pickers
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 && indexPath.row == 0 {
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            
            if harvestingDatePickerVisible == true {
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            if harvestingPickerVisible == true {
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }
            
            tableView.deselectRow(at: indexPath, animated: true)
            showFloweringPicker()
        }
        
        if indexPath.section == 1 && indexPath.row == 2{
            if floweringPickerVisible == true{
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if harvestingDatePickerVisible == true {
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            if harvestingPickerVisible == true {
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }
            
            showFloweringDatePicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }
//        MARK: - SECTION 2
        if indexPath.section == 2 && indexPath.row == 0{
            if harvestingDatePickerVisible == true{
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            if floweringPickerVisible == true {
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }
            showHarvestingPicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }

        if indexPath.section == 2 && indexPath.row == 2{
            if harvestingPickerVisible == true{
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            if floweringPickerVisible == true {
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }
            
            showHarvestingDatePicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }
//          MARK: - SECTION 3
        
        if indexPath.section == 3 && indexPath.row == 0{
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            if floweringPickerVisible == true {
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if harvestingDatePickerVisible == true {
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            if harvestingPickerVisible == true {
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }
            
            showSunExposurePicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }

        if indexPath.section == 3 && indexPath.row == 2{
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            if floweringPickerVisible == true {
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if harvestingDatePickerVisible == true {
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            if harvestingPickerVisible == true {
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }

            showSunExposureDatePicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }
//          MARK: - SECTION 4
        
        if indexPath.section == 4 && indexPath.row == 0{
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            if floweringPickerVisible == true {
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if harvestingDatePickerVisible == true {
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            if harvestingPickerVisible == true {
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }
            
            showBoosterPicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }

        if indexPath.section == 4 && indexPath.row == 2{
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            if floweringPickerVisible == true {
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if harvestingDatePickerVisible == true {
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            if harvestingPickerVisible == true {
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }
            showBoosterDatePicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }
//          MARK: - SECTION 5
        
        if indexPath.section == 5 && indexPath.row == 0{
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            if floweringPickerVisible == true {
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if harvestingDatePickerVisible == true {
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            if harvestingPickerVisible == true {
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }
            showWateringPicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }

        if indexPath.section == 5 && indexPath.row == 2{
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            if floweringPickerVisible == true {
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if harvestingDatePickerVisible == true {
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            if harvestingPickerVisible == true {
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }
            
            
            showWateringDatePicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }
//          MARK: - SECTION 6
        if indexPath.section == 6 && indexPath.row == 0{
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            if floweringPickerVisible == true {
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if harvestingDatePickerVisible == true {
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            if harvestingPickerVisible == true {
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }
            
            showPruningPicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }

        if indexPath.section == 6 && indexPath.row == 2{
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            if floweringPickerVisible == true {
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if harvestingDatePickerVisible == true {
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            if harvestingPickerVisible == true {
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }
            
            
            showPruningDatePicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }
//          MARK: - SECTION 7
        if indexPath.section == 7 && indexPath.row == 0{
            if pesticideDatePickerVisible == true{
                pesticideDatePickerVisible = !pesticideDatePickerVisible
            }
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            if floweringPickerVisible == true {
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if harvestingDatePickerVisible == true {
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            if harvestingPickerVisible == true {
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            showPesticidePicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }

        if indexPath.section == 7 && indexPath.row == 2{
            if pesticidePickerVisible == true{
                pesticidePickerVisible = !pesticidePickerVisible
            }
            
            if floweringDatePickerVisible == true {
                floweringDatePickerVisible = !floweringDatePickerVisible
            }
            if floweringPickerVisible == true {
                floweringPickerVisible = !floweringPickerVisible
            }
            
            if harvestingDatePickerVisible == true {
                harvestingDatePickerVisible = !harvestingDatePickerVisible
            }
            if harvestingPickerVisible == true {
                harvestingPickerVisible = !harvestingPickerVisible
            }
            
            if sunExposureDatePickerVisible == true{
                sunExposureDatePickerVisible = !sunExposureDatePickerVisible
            }
            if sunExposurePickerVisible == true{
                sunExposurePickerVisible = !sunExposurePickerVisible
            }
            
            if boosterDatePickerVisible == true{
                boosterDatePickerVisible = !boosterDatePickerVisible
            }
            if boosterPickerVisible == true{
                boosterPickerVisible = !boosterPickerVisible
            }
            
            if wateringDatePickerVisible == true{
                wateringDatePickerVisible = !wateringDatePickerVisible
            }
            if wateringPickerVisible == true{
                wateringPickerVisible = !wateringPickerVisible
            }
            
            if pruningDatePickerVisible == true{
                pruningDatePickerVisible = !pruningDatePickerVisible
            }
            if pruningPickerVisible == true{
                pruningPickerVisible = !pruningPickerVisible
            }
            
            showPesticideDatePicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            if indexPath.row == 0 {
                return 300
            }else {
                return 50
            }
        }else if indexPath.section == 1{
            if indexPath.row == 1 {
                if !floweringPickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
            if indexPath.row == 3 {
                if !floweringDatePickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
        }else if indexPath.section == 2{
            if indexPath.row == 1 {
                if !harvestingPickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
            if indexPath.row == 3 {
                if !harvestingDatePickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
        }else if indexPath.section == 3{
            if indexPath.row == 1 {
                if !sunExposurePickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
            if indexPath.row == 3 {
                if !sunExposureDatePickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
        }else if indexPath.section == 4{
            if indexPath.row == 1 {
                if !boosterPickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
            if indexPath.row == 3 {
                if !boosterDatePickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
        }else if indexPath.section == 5{
            if indexPath.row == 1 {
                if !wateringPickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
            if indexPath.row == 3 {
                if !wateringDatePickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
        }else if indexPath.section == 6{
            if indexPath.row == 1 {
                if !pruningPickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
            if indexPath.row == 3 {
                if !pruningDatePickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
        }else if indexPath.section == 7{
            if indexPath.row == 1 {
                if !pesticidePickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
            if indexPath.row == 3 {
                if !pesticideDatePickerVisible {
                    return 0
                }else {
                    return 100
                }
            }
        }
        return 50
    }
    
    
    func showFloweringPicker () {
        floweringPickerVisible = !floweringPickerVisible
    
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func showFloweringDatePicker () {
        
        floweringDatePickerVisible = !floweringDatePickerVisible
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func showHarvestingPicker () {
        harvestingPickerVisible = !harvestingPickerVisible
    
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func showHarvestingDatePicker () {
        
        harvestingDatePickerVisible = !harvestingDatePickerVisible
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func showSunExposurePicker () {
        sunExposurePickerVisible = !sunExposurePickerVisible
    
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func showSunExposureDatePicker () {
        
        sunExposureDatePickerVisible = !sunExposureDatePickerVisible
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func showBoosterPicker () {
        boosterPickerVisible = !boosterPickerVisible
    
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func showBoosterDatePicker () {
        
        boosterDatePickerVisible = !boosterDatePickerVisible
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func showWateringPicker () {
        wateringPickerVisible = !wateringPickerVisible
    
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func showWateringDatePicker () {
        
        wateringDatePickerVisible = !wateringDatePickerVisible
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func showPruningPicker () {
        pruningPickerVisible = !pruningPickerVisible
    
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func showPruningDatePicker () {
        
        pruningDatePickerVisible = !pruningDatePickerVisible
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func showPesticidePicker () {
        pesticidePickerVisible = !pesticidePickerVisible
    
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func showPesticideDatePicker () {
        
        pesticideDatePickerVisible = !pesticideDatePickerVisible
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
//    MARK: - Create Table View
    func addInitailValue() {
        
        inputDates.append(Date())
    }

    
    func createTableView() {
        
        data.append(PhotoInformation(plantPhoto: plantImage))
        data.append(NameInformation(plantNameField: plantName))
        
        firstSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo:"))
        firstSectionData.append(PickerInformation(picker: floweringPicker))
        firstSectionData.append(LastActionInformation(lastActionLabel: "Última:"))
        firstSectionData.append(DatePickerInformation(datePicker: floweringDatePicker))
        
        secondSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo:"))
        secondSectionData.append(PickerInformation(picker: harvestingPicker))
        secondSectionData.append(LastActionInformation(lastActionLabel: "Última:"))
        secondSectionData.append(DatePickerInformation(datePicker: harvestingDatePicker))
        
        thirdSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo:"))
        thirdSectionData.append(PickerInformation(picker: sunExposurePicker))
        thirdSectionData.append(LastActionInformation(lastActionLabel: "Última:"))
        thirdSectionData.append(DatePickerInformation(datePicker: sunExposureDatePicker))
        
        fourthSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo:"))
        fourthSectionData.append(PickerInformation(picker: boosterPicker))
        fourthSectionData.append(LastActionInformation(lastActionLabel: "Última:"))
        fourthSectionData.append(DatePickerInformation(datePicker: boosterDatePicker))
        
        fifthSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo:"))
        fifthSectionData.append(PickerInformation(picker: wateringPicker))
        fifthSectionData.append(LastActionInformation(lastActionLabel: "Última:"))
        fifthSectionData.append(DatePickerInformation(datePicker: wateringDatePicker))
        
        sixthSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo:"))
        sixthSectionData.append(PickerInformation(picker: pruningPicker))
        sixthSectionData.append(LastActionInformation(lastActionLabel: "Última:"))
        sixthSectionData.append(DatePickerInformation(datePicker: pruningDatePicker))

        seventhSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo:"))
        seventhSectionData.append(PickerInformation(picker: pesticidePicker))
        seventhSectionData.append(LastActionInformation(lastActionLabel: "Última:"))
        seventhSectionData.append(DatePickerInformation(datePicker: pesticideDatePicker))
        
        tableView.reloadData()
    }
    
    
    @objc func cancelCreation(_ sender: Any){
        
        self.dismiss(animated: true)
    }

    
    @objc func doneCreation(_ sender: Any){
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        pickerAddPhotoButton.dismiss(animated: true, completion: nil)
        
        guard let pickedImage = info[.originalImage] as? UIImage else {
            return print("Error")
            
        }

        if data[0] is PhotoInformation {
            data[0] = PhotoInformation(plantPhoto: pickedImage)
            tableView.reloadData()
            plantImage = pickedImage
        }
    }
        
    
    @objc func dismissAlertController(){
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func saveImage(imageName: String, image: UIImage) {
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
            
        }
        
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }
        
    }
    
    
    
        func registerPlant () {
            
    //        let plant = NSEntityDescription.insertNewObject(forEntityName: "Plant", into: context!) as! Plant
    //
    //        plant.id = UUID()
    //
    //        plant.name = plantName.text
    //
    //        let temp:String = UUID().uuidString
    //        guard let imageName = temp as? String else { fatalError("Invalid Message Name!") }
    //
    //        guard let image = plantImage as? UIImage else { fatalError("Invalid Image") }
    //
    //        saveImage(imageName: imageName, image: image)
    //        plant.image = imageName
    //
    //        plant.floweringPeriod = Int32(floweringPicker.selectedRow(inComponent: 0))
    //            //plant.floweringInterval
            
        }
    
}

