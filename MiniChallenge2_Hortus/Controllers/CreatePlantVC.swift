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
    
    var pickerDataDays: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    var pickerData: [String] = ["Horas","Dias","Meses"]
    
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
    
    var harvestingPicker = UIPickerView()
    var harvestingDatePicker = UIDatePicker()
    
    var sunExposurePicker = UIPickerView()
    var sunExposureDatePicker = UIDatePicker()
    
    var boosterPicker = UIPickerView()
    var boosterDatePicker = UIDatePicker()
    
    
    var wateringPicker = UIPickerView()
    var wateringDatePicker = UIDatePicker()
    
    var pruningPicker = UIPickerView()
    var pruningDatePicker = UIDatePicker()
    
    var pesticidePicker = UIPickerView()
    var pesticideDatePicker = UIDatePicker()
    
    var tableViewCells: [UITableViewCell] = []
    
    var plantName = UITextField()
    
    var plantImage = UIImage()
    
    var dpShowVisible = false
    
    var dpShowDateVisible = false
    
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
        
        plantImage = #imageLiteral(resourceName: "AddFotoCompleto")
        
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
        
        if section == 0 {
            return 2
        }
        return 4
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
                if (secondSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = secondSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
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
                if (thirdSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = thirdSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
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
                if (fourthSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = fourthSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
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
                if (fifthSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = fifthSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
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
                if (sixthSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = sixthSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
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
                if (seventhSectionData[indexPath.row] is LastActionInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                        if let lastActionInformation = seventhSectionData[indexPath.row] as? LastActionInformation {
                            cell.lastActionInformation = lastActionInformation
                            return cell
                        }
                    }
                }
            }
        }
        return UITableViewCell()
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 && indexPath.row == 0 {
            if dpShowDateVisible == true {
                dpShowDateVisible = !dpShowDateVisible
            }
            tableView.deselectRow(at: indexPath, animated: true)
            showPicker()
        }
        
        if indexPath.section == 1 && indexPath.row == 2{
            if dpShowVisible == true{
                dpShowVisible = !dpShowVisible
            }
            showDatePicker()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            if indexPath.row == 0 {
                return 400
            }else {
                return 50
            }
        }else if indexPath.section == 1{
            if indexPath.row == 1 {
                if !dpShowVisible {
                    return 0
                }else {
                    return 100
                }
            }
            if indexPath.row == 3 {
                if !dpShowDateVisible {
                    return 0
                }else {
                    return 100
                }
            }
        }
        return 50
    }
    
    
    func showPicker () {
        dpShowVisible = !dpShowVisible
    
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func showDatePicker () {
        
        dpShowDateVisible = !dpShowDateVisible
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
        secondSectionData.append(LastActionInformation(lastActionLabel: "Última:"))
        
        thirdSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo:"))
        thirdSectionData.append(LastActionInformation(lastActionLabel: "Última:"))
        
        fourthSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo:"))
        fourthSectionData.append(LastActionInformation(lastActionLabel: "Última:"))
        
        fifthSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo:"))
        fifthSectionData.append(LastActionInformation(lastActionLabel: "Última:"))
        
        sixthSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo:"))
        sixthSectionData.append(LastActionInformation(lastActionLabel: "Última:"))

        seventhSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo:"))
        seventhSectionData.append(LastActionInformation(lastActionLabel: "Última:"))
        
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

