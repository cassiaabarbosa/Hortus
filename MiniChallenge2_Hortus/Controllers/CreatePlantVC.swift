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
    
    var data = Array<Any>()
    var firstSectionData = Array<Any>()
    var secondSectionData = Array<Any>()
    var thirdSectionData = Array<Any>()
    var fourthSectionData = Array<Any>()
    var fifthSectionData = Array<Any>()
    var sixthSectionData = Array<Any>()
    var seventhSectionData = Array<Any>()
    
    var pickerAddPhotoButton = UIImagePickerController()
    
    var inputDates: [Date] = []
    var inputTexts: [String] = []
    
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
        
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Adicionar", style: .done, target: self, action: #selector(cancelCreation(_:))), animated: true)
        navigationItem.setLeftBarButton(UIBarButtonItem(title: "Cancelar", style: .plain , target: self, action: #selector(cancelCreation(_:))), animated: true)
        
        navigationItem.leftBarButtonItem?.tintColor = UIColor.App.delete
        
        //tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.addSubview(headerView)
        //tableView.addSubview(labelView)
        
        tableView.backgroundColor = .lightGray
        //tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        tableView.keyboardDismissMode = .onDrag
        
        plantImage = #imageLiteral(resourceName: "AddFotoCompleto")
        
        pickerAddPhotoButton.delegate = self
        
        addInitailValue()
        createTableView()
        
        //self.headerView.backgroundColor = .red
        //self.labelView.text = "My header view"
        
        
        tableView.register(PhotoCreatePlantCell.self, forCellReuseIdentifier: photoCellId)
        tableView.register(NameCreatePlantCell.self, forCellReuseIdentifier: nameCellId)
        tableView.register(FrequencyCell.self, forCellReuseIdentifier: frequencyCellId)
        tableView.register(LastActionCell.self, forCellReuseIdentifier: lastActionCellId)
        //Register cells
        

        func textFieldShouldReturn(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 75
    }
    
    
    
        override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 100))
    
            let label = UILabel()
                label.frame = CGRect.init(x: 5, y: 25, width: headerView.frame.width-10, height: headerView.frame.height-10)
            
            label.font = UIFont.systemFont(ofSize: 17)
            label.textColor = .black
            
            
            let image = UIImageView()
            //image.topAnchor = CGRect.init(x: 0, y: 25, width: 50, height: 50)

            
                headerView.addSubview(label)
                headerView.addSubview(image)
            
            
            if section ==  1 {
                image.image = #imageLiteral(resourceName: "Flower")
                label.text = "Floração"
            }else if section == 2 {
                 image.image = #imageLiteral(resourceName: "Harvest")
                 label.text = "Colheita"
            }else if section == 3 {
                 image.image = #imageLiteral(resourceName: "Sun")
                label.text = "Exposição solar"
            }else if section == 4 {
                 image.image = #imageLiteral(resourceName: "Booster")
                label.text = "Fertilizantes"
            }else if section == 5 {
                 image.image = #imageLiteral(resourceName: "Drop")
                label.text = "Rega"
            }else if section == 6 {
                 image.image = #imageLiteral(resourceName: "Scisor")
                label.text = "Poda"
            }else {
                 image.image = #imageLiteral(resourceName: "Pesticide")
                label.text = "Pesticidas"
            }
            
    
                return headerView
            }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
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
            }else if (data[indexPath.row] is NameInformation) {
                if let cell = tableView.dequeueReusableCell(withIdentifier: nameCellId) as? NameCreatePlantCell {
                    return cell
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
                    if (firstSectionData[indexPath.row] is LastActionInformation) {
                        if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                            if let lastActionInformation = firstSectionData[indexPath.row] as? LastActionInformation {
                                cell.lastActionInformation = lastActionInformation
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
            }else if indexPath.row == 2{
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
    
    
    func addInitailValue() {
        
        inputDates.append(Date())
        
    }


    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 8
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        self.tableView.beginUpdates()
//        self.tableView.endUpdates()
    }

    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                 return 400
            }else{
                return 50
            }
        }else{
            return 150
            
        }
    }
    
    
    
    func createTableView() {
        data.append(PhotoInformation(plantPhoto: plantImage))
        data.append(NameInformation(plantNameField: plantName))
        
        
        firstSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de floração",  picker: floweringPicker))
        firstSectionData.append(LastActionInformation(lastActionLabel: "Última floração", picker: floweringDatePicker))
        
        
        secondSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de colheita",  picker: harvestingPicker))
       secondSectionData.append(LastActionInformation(lastActionLabel: "Última colheita",  picker: harvestingDatePicker))
        
        
        thirdSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de Exposição solar",  picker: sunExposurePicker))
        thirdSectionData.append(LastActionInformation(lastActionLabel: "Última exposição solar", picker: sunExposureDatePicker))
        
        
        fourthSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo fertilização",  picker: boosterPicker))
        fourthSectionData.append(LastActionInformation(lastActionLabel: "Última fertilização",  picker: boosterDatePicker))
        
        
        fifthSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de rega",  picker: wateringPicker))
        fifthSectionData.append(LastActionInformation(lastActionLabel: "Última rega",  picker: wateringDatePicker))
        
        
        sixthSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de poda",  picker: pruningPicker))
        sixthSectionData.append(LastActionInformation(lastActionLabel: "Última poda",  picker: pruningDatePicker))
        

        seventhSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de pesticidas",  picker: pesticidePicker))
        seventhSectionData.append(LastActionInformation(lastActionLabel: "Última aplicação de pesticidas", picker: pesticideDatePicker))
        
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
    
    
    
    func saveImage(imageName: String, image: UIImage) {
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }
        
        //Checks if file exists, removes it if so.
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

    

    
}

