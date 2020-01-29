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

class CreatePlantVC : UIViewController, UIImagePickerControllerDelegate {
    
    var context : NSManagedObjectContext?
//    var plant : Plant? = Plant()
    var table = CreatePlantView()
    var createPlantViewTableHandler = CreatePlantViewTableHandler()

    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

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
        
       self.view.addSubview(table)
       
       setTable()
       
       
       table.table.keyboardDismissMode = .onDrag
    

        func textFieldShouldReturn(textField: UITextField) -> Bool {
            
            textField.resignFirstResponder()
            return true
        }
        
    }
    
    
    
    func setTable() {
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        table.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
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
    

    
    
    
    
    @objc func cancelCreation(_ sender: Any){
        
        self.dismiss(animated: true)
    }

    
    @objc func doneCreation(_ sender: Any){
        registerPlant()
        self.dismiss(animated: true)
    }
    
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        pickerAddPhotoButton.dismiss(animated: true, completion: nil)
//
//        guard let pickedImage = info[.originalImage] as? UIImage else {
//            return print("Error")
//
//        }
//
//        if data[0] is PhotoInformation {
//            data[0] = PhotoInformation(plantPhoto: pickedImage)
//            tableView.reloadData()
//            plantImage = pickedImage
//        }
//    }
        
    
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
//
//            let plant = NSEntityDescription.insertNewObject(forEntityName: "Plant", into: context!) as! Plant
//
//            plant.id = UUID()
//
//            plant.plantName = plantName.text
//
//            let temp:String = UUID().uuidString
//            guard let imageName = temp as? String else { fatalError("Invalid Message Name!") }
//
//            guard let image = plantImage as? UIImage else { fatalError("Invalid Image") }
//
//            saveImage(imageName: imageName, image: image)
//            plant.plantImage = imageName
//
//            plant.floweringPeriod = Int32(floweringPicker.selectedRow(inComponent: 0))
//            plant.floweringInterval = String(floweringPicker.selectedRow(inComponent: 1))
//
//            plant.harvestingPeriod = Int32(harvestingPicker.selectedRow(inComponent: 0))
//            plant.harvestingInterval = String(harvestingPicker.selectedRow(inComponent: 1))
//
//            plant.sunExposurePeriod = Int32(sunExposurePicker.selectedRow(inComponent: 0))
//            plant.sunExposureInterval = String(sunExposurePicker.selectedRow(inComponent: 1))
//
//            plant.boosterPeriod = Int32(boosterPicker.selectedRow(inComponent: 0))
//            plant.boosterInterval = String(boosterPicker.selectedRow(inComponent: 1))
//
//            plant.wateringPeriod = Int32(wateringPicker.selectedRow(inComponent: 0))
//            plant.wateringInterval = String(wateringPicker.selectedRow(inComponent: 1))
//
//            plant.pruningPeriod = Int32(pruningPicker.selectedRow(inComponent: 0))
//            plant.pruningInterval = String(pruningPicker.selectedRow(inComponent: 1))
//
//            plant.pesticidePeriod = Int32(pesticidePicker.selectedRow(inComponent: 0))
//            plant.pesticideInterval = String(pesticidePicker.selectedRow(inComponent: 1))
//
//            plant.floweringLastDate = floweringDatePicker.date
//            plant.harvestingLastDate = harvestingDatePicker.date
//            plant.sunExposureLastDate = sunExposureDatePicker.date
//            plant.boosterLastDate = boosterDatePicker.date
//            plant.wateringLastDate = wateringDatePicker.date
//            plant.pruningLastDate = pruningDatePicker.date
//            plant.pesticideLastDate = pruningDatePicker.date
//
//            switch interval[floweringPicker.selectedRow(inComponent: 0)] {
//            case "Horas":
//                let futureDate = floweringDatePicker.calendar?.date(byAdding: .hour, value: Int(hour[floweringPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.floweringNextDate = futureDate
//
//            case "Dias":
//                let futureDate = floweringDatePicker.calendar?.date(byAdding: .day, value: Int(hour[floweringPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.floweringNextDate = futureDate
//
//
//            case "Semanas":
//                let futureDate = floweringDatePicker.calendar?.date(byAdding: .weekday, value: Int(hour[floweringPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.floweringNextDate = futureDate
//
//            case "Meses":
//                let futureDate = floweringDatePicker.calendar?.date(byAdding: .month, value: Int(hour[floweringPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.floweringNextDate = futureDate
//            default:
//                fatalError("404 - Interval")
//            }
//
//            switch interval[harvestingPicker.selectedRow(inComponent: 0)] {
//            case "Horas":
//                let futureDate = harvestingDatePicker.calendar?.date(byAdding: .hour, value: Int(hour[harvestingPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.harvestingNextDate = futureDate
//
//            case "Dias":
//                let futureDate = harvestingDatePicker.calendar?.date(byAdding: .day, value: Int(hour[harvestingPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.harvestingNextDate = futureDate
//
//
//            case "Semanas":
//                let futureDate = harvestingDatePicker.calendar?.date(byAdding: .weekday, value: Int(hour[harvestingPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.harvestingNextDate = futureDate
//
//            case "Meses":
//                let futureDate = harvestingDatePicker.calendar?.date(byAdding: .month, value: Int(hour[harvestingPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.harvestingNextDate = futureDate
//            default:
//                fatalError("404 - Interval")
//            }
//
//            switch interval[sunExposurePicker.selectedRow(inComponent: 0)] {
//            case "Horas":
//                let futureDate = sunExposureDatePicker.calendar?.date(byAdding: .hour, value: Int(hour[sunExposurePicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.sunExposureNextDate = futureDate
//
//            case "Dias":
//                let futureDate = sunExposureDatePicker.calendar?.date(byAdding: .day, value: Int(hour[sunExposurePicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.sunExposureNextDate = futureDate
//
//
//            case "Semanas":
//                let futureDate = sunExposureDatePicker.calendar?.date(byAdding: .weekday, value: Int(hour[sunExposurePicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.sunExposureNextDate = futureDate
//
//            case "Meses":
//                let futureDate = sunExposureDatePicker.calendar?.date(byAdding: .month, value: Int(hour[harvestingPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.sunExposureNextDate = futureDate
//            default:
//                fatalError("404 - Interval")
//            }
//
//            switch interval[boosterPicker.selectedRow(inComponent: 0)] {
//            case "Horas":
//                let futureDate = boosterDatePicker.calendar?.date(byAdding: .hour, value: Int(hour[boosterPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.boosterNextDate = futureDate
//
//            case "Dias":
//                let futureDate = boosterDatePicker.calendar?.date(byAdding: .day, value: Int(hour[boosterPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.boosterNextDate = futureDate
//
//
//            case "Semanas":
//                let futureDate = boosterDatePicker.calendar?.date(byAdding: .weekday, value: Int(hour[sunExposurePicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.boosterNextDate = futureDate
//
//            case "Meses":
//                let futureDate = boosterDatePicker.calendar?.date(byAdding: .month, value: Int(hour[harvestingPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.boosterNextDate = futureDate
//            default:
//                fatalError("404 - Interval")
//            }
//
//            switch interval[wateringPicker.selectedRow(inComponent: 0)] {
//            case "Horas":
//                let futureDate = wateringDatePicker.calendar?.date(byAdding: .hour, value: Int(hour[wateringPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.wateringNextDate = futureDate
//
//            case "Dias":
//                let futureDate = wateringDatePicker.calendar?.date(byAdding: .day, value: Int(hour[wateringPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.wateringNextDate = futureDate
//
//
//            case "Semanas":
//                let futureDate = wateringDatePicker.calendar?.date(byAdding: .weekday, value: Int(hour[wateringPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.wateringNextDate = futureDate
//
//            case "Meses":
//                let futureDate = wateringDatePicker.calendar?.date(byAdding: .month, value: Int(hour[wateringPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.wateringNextDate = futureDate
//            default:
//                fatalError("404 - Interval")
//            }
//
//            switch interval[pruningPicker.selectedRow(inComponent: 0)] {
//            case "Horas":
//                let futureDate = pruningDatePicker.calendar?.date(byAdding: .hour, value: Int(hour[pruningPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.pruningNextDate = futureDate
//
//            case "Dias":
//                let futureDate = pruningDatePicker.calendar?.date(byAdding: .day, value: Int(hour[pruningPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.pruningNextDate = futureDate
//
//
//            case "Semanas":
//                let futureDate = pruningDatePicker.calendar?.date(byAdding: .weekday, value: Int(hour[pruningPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.pruningNextDate = futureDate
//
//            case "Meses":
//                let futureDate = pruningDatePicker.calendar?.date(byAdding: .month, value: Int(hour[pruningPicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.pruningNextDate = futureDate
//            default:
//                fatalError("404 - Interval")
//            }
//
//
//            switch interval[pesticidePicker.selectedRow(inComponent: 0)] {
//            case "Horas":
//                let futureDate = pesticideDatePicker.calendar?.date(byAdding: .hour, value: Int(hour[pesticidePicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.pruningNextDate = futureDate
//
//            case "Dias":
//                let futureDate = pesticideDatePicker.calendar?.date(byAdding: .day, value: Int(hour[pesticidePicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.pesticideNextDate = futureDate
//
//
//            case "Semanas":
//                let futureDate = pesticideDatePicker.calendar?.date(byAdding: .weekday, value: Int(hour[pesticidePicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.pesticideNextDate = futureDate
//
//            case "Meses":
//                let futureDate = pesticideDatePicker.calendar?.date(byAdding: .month, value: Int(hour[pesticidePicker.selectedRow(inComponent: 1)])!, to: Date())
//                plant.pesticideNextDate = futureDate
//            default:
//                fatalError("404 - Interval")
//            }
//
//
//            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//            appDelegate.saveContext()
//
//
//
    }
    
}

