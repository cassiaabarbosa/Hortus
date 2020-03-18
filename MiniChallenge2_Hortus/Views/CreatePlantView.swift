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
    var createPlantViewTableHandler = CreatePlantViewTableHandler()
    var plantCardViewCollectionHandler = PlantCardViewCollectionHandler()
    
    let nameCellId: String = "nameCellId"
    let photoCellId: String = "photoCellid"
    let taskCellId: String = "taskCellId"
    let frequencyCellId: String = "frequencyCellId"
    let lastActionCellId: String = "lastActionCellId"
    let customHeaderCellId: String = "customHeaderCellId"
    let pickerCellId: String = "pickerCellId"
    let datePickerCellId: String = "datePickerCellId"
    var parentVC: CreatePlantVC?
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        createPlantViewTableHandler = CreatePlantViewTableHandler()
        createPlantViewTableHandler.parentVC = self
        
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
    
    func savePlant() {
        
        let floweringInterval: String = String( self.createPlantViewTableHandler.floweringPicker.picker.selectedRow(inComponent: 0))
        let floweringPeriod: Int32 = Int32(self.createPlantViewTableHandler.floweringPicker.picker.selectedRow(inComponent: 1))
        let floweringLastDate: Date = self.createPlantViewTableHandler.floweringDatePicker.datePicker.date

        let harvestingInterval: String = String(self.createPlantViewTableHandler.harvestingPicker.picker.selectedRow(inComponent: 0))
        let harvestingPeriod: Int32 = Int32(self.createPlantViewTableHandler.harvestingPicker.picker.selectedRow(inComponent: 1))
        let harvestingLastDate: Date = self.createPlantViewTableHandler.harvestingDatePicker.datePicker.date
        
        let sunExposureInterval: String = String(self.createPlantViewTableHandler.sunExposurePicker.picker.selectedRow(inComponent: 0))
        let sunExposurePeriod: Int32 = Int32(self.createPlantViewTableHandler.sunExposurePicker.picker.selectedRow(inComponent: 1))
        let sunExposureLastDate: Date = self.createPlantViewTableHandler.sunExposureDatePicker.datePicker.date
        
        let boosterInterval: String = String(self.createPlantViewTableHandler.boosterPicker.picker.selectedRow(inComponent: 0))
        let boosterPeriod: Int32 = Int32(self.createPlantViewTableHandler.boosterPicker.picker.selectedRow(inComponent: 1))
        let boosterLastDate: Date = self.createPlantViewTableHandler.boosterDatePicker.datePicker.date
        
        let wateringInterval: String = String(self.createPlantViewTableHandler.wateringPicker.picker.selectedRow(inComponent: 0))
        let wateringPeriod: Int32 = Int32(self.createPlantViewTableHandler.wateringPicker.picker.selectedRow(inComponent: 1))
        let wateringLastDate: Date = self.createPlantViewTableHandler.wateringDatePicker.datePicker.date
        
        let pruningInterval: String = String(self.createPlantViewTableHandler.pruningPicker.picker.selectedRow(inComponent: 0))
        let pruningPeriod: Int32 = Int32(self.createPlantViewTableHandler.pruningPicker.picker.selectedRow(inComponent: 1))
        let pruningLastDate: Date = self.createPlantViewTableHandler.pruningDatePicker.datePicker.date
        
        let pesticideInterval: String = String(self.createPlantViewTableHandler.pesticidePicker.picker.selectedRow(inComponent: 0))
        let pesticidePeriod: Int32 = Int32(self.createPlantViewTableHandler.pesticidePicker.picker.selectedRow(inComponent: 1))
        let pesticideLastDate: Date = self.createPlantViewTableHandler.pesticideDatePicker.datePicker.date
       
        let plantName: String = String(self.createPlantViewTableHandler.plantName.name.text ?? "Planta")
        
        let temp:String = UUID().uuidString
        
        let imageName = temp 
         
        guard let image = self.createPlantViewTableHandler.plantPhoto.photo.image else { fatalError("Invalid Image")}
        
        saveImage(imageName: imageName, image: image)
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        if let plant =
        NSEntityDescription.insertNewObject(forEntityName: "Plant",
                                            into: context) as? Plant {
            
            plant.id = UUID()
            plant.plantName = plantName
            plant.plantImage = imageName
            
            plant.floweringInterval = floweringInterval
            plant.floweringPeriod = floweringPeriod
            plant.floweringLastDate = floweringLastDate
            switch floweringInterval {
                
            case "0":
                let nextFloweringDate = self.createPlantViewTableHandler.floweringDatePicker.datePicker.calendar.date(byAdding: .hour, value: Int(floweringPeriod), to: floweringLastDate)
                plant.floweringNextDate = nextFloweringDate
                
            case "1":
                let nextFloweringDate = self.createPlantViewTableHandler.floweringDatePicker.datePicker.calendar.date(byAdding: .hour, value: Int(floweringPeriod), to: floweringLastDate)
                plant.floweringNextDate = nextFloweringDate
                
            case "2":
                let nextFloweringDate = self.createPlantViewTableHandler.floweringDatePicker.datePicker.calendar.date(byAdding: .month, value: Int(floweringPeriod), to: floweringLastDate)
                plant.floweringNextDate = nextFloweringDate
            default:
                fatalError("404 - Interval")
            }
            
            plant.harvestingInterval = harvestingInterval
            plant.harvestingPeriod = harvestingPeriod
            plant.harvestingLastDate = harvestingLastDate
            switch harvestingInterval {
            case "0" :
                let nextHarvestingDate = self.createPlantViewTableHandler.harvestingDatePicker.datePicker.calendar.date(byAdding: .hour, value: Int(harvestingPeriod), to: harvestingLastDate)
                    plant.harvestingNextDate = nextHarvestingDate
            
            case "1" :
                let nextHarvestingDate = self.createPlantViewTableHandler.harvestingDatePicker.datePicker.calendar.date(byAdding: .day, value: Int(harvestingPeriod), to: harvestingLastDate)
                plant.harvestingNextDate = nextHarvestingDate
            
            case "2" :
                let nextHarvestingDate = self.createPlantViewTableHandler.harvestingDatePicker.datePicker.calendar.date(byAdding: .month, value: Int(harvestingPeriod), to: harvestingLastDate)
                plant.harvestingNextDate = nextHarvestingDate
            default:
                fatalError("404 - Interval")
            }
            
            
            plant.sunExposureInterval = sunExposureInterval
            plant.sunExposurePeriod = sunExposurePeriod
            plant.sunExposureLastDate = sunExposureLastDate
            switch sunExposureInterval {
            case "0" :
                let nextSunExposureDate = self.createPlantViewTableHandler.sunExposureDatePicker.datePicker.calendar.date(byAdding: .hour, value: Int(sunExposurePeriod), to: sunExposureLastDate)
                    plant.sunExposureNextDate = nextSunExposureDate
            
            case "1" :
                let nextSunExposureDate = self.createPlantViewTableHandler.sunExposureDatePicker.datePicker.calendar.date(byAdding: .day, value: Int(sunExposurePeriod), to: sunExposureLastDate)
                plant.sunExposureNextDate = nextSunExposureDate
                
            case "2" :
                let nextSunExposureDate = self.createPlantViewTableHandler.sunExposureDatePicker.datePicker.calendar.date(byAdding: .month, value: Int(sunExposurePeriod), to: sunExposureLastDate)
                plant.sunExposureNextDate = nextSunExposureDate
            default:
                fatalError("404 - Interval")
            }
            
            
            plant.boosterInterval = boosterInterval
            plant.boosterPeriod = boosterPeriod
            plant.boosterLastDate = boosterLastDate
            switch boosterInterval {
            case "0" :
                let nextBoosterDate = self.createPlantViewTableHandler.boosterDatePicker.datePicker.calendar.date(byAdding: .hour, value: Int(boosterPeriod), to: boosterLastDate)
                    plant.boosterNextDate = nextBoosterDate
                
            case "1" :
                let nextBoosterDate = self.createPlantViewTableHandler.boosterDatePicker.datePicker.calendar.date(byAdding: .day, value: Int(boosterPeriod), to: boosterLastDate)
                plant.boosterNextDate = nextBoosterDate
                
            case "2" :
                let nextBoosterDate = self.createPlantViewTableHandler.boosterDatePicker.datePicker.calendar.date(byAdding: .month, value: Int(boosterPeriod), to: boosterLastDate)
                plant.boosterNextDate = nextBoosterDate
            default:
                fatalError("404 - Interval")
            }
            
            
            plant.wateringInterval = wateringInterval
            plant.wateringPeriod = wateringPeriod
            plant.wateringLastDate = wateringLastDate
            switch wateringInterval {
            case "0" :
                let nextWateringDate = self.createPlantViewTableHandler.wateringDatePicker.datePicker.calendar.date(byAdding: .hour, value: Int(wateringPeriod), to: wateringLastDate)
                    plant.wateringNextDate = nextWateringDate
                
            case "1" :
                let nextWateringDate = self.createPlantViewTableHandler.wateringDatePicker.datePicker.calendar.date(byAdding: .day, value: Int(wateringPeriod), to: wateringLastDate)
                plant.wateringNextDate = nextWateringDate
                
            case "2" :
                let nextWateringDate = self.createPlantViewTableHandler.wateringDatePicker.datePicker.calendar.date(byAdding: .month, value: Int(wateringPeriod), to: wateringLastDate)
                plant.wateringNextDate = nextWateringDate
            default:
                fatalError("404 - Interval")
            }
            
            
            plant.pruningInterval = pruningInterval
            plant.pruningPeriod = pruningPeriod
            plant.pruningLastDate = pruningLastDate
            switch pruningInterval {
            case "0" :
                let nextPruningDate = self.createPlantViewTableHandler.pruningDatePicker.datePicker.calendar.date(byAdding: .hour, value: Int(pruningPeriod), to: pruningLastDate)
                    plant.pruningNextDate = nextPruningDate
                
            case "1" :
                let nextPruningDate = self.createPlantViewTableHandler.pruningDatePicker.datePicker.calendar.date(byAdding: .day, value: Int(pruningPeriod), to: pruningLastDate)
                plant.pruningNextDate = nextPruningDate
                
            case "2" :
                let nextPruningDate = self.createPlantViewTableHandler.pruningDatePicker.datePicker.calendar.date(byAdding: .month, value: Int(pruningPeriod), to: pruningLastDate)
                plant.pruningNextDate = nextPruningDate
            default:
                fatalError("404 - Interval")
            }
            
            
            plant.pesticideInterval = pesticideInterval
            plant.pesticidePeriod = pesticidePeriod
            plant.pesticideLastDate = pesticideLastDate
            switch pesticideInterval {
            case "0" :
                let nextPesticideDate = self.createPlantViewTableHandler.pesticideDatePicker.datePicker.calendar.date(byAdding: .hour, value: Int(pesticidePeriod), to: pesticideLastDate)
                    plant.pesticideNextDate = nextPesticideDate
                
            case "1" :
                let nextPesticideDate = self.createPlantViewTableHandler.pesticideDatePicker.datePicker.calendar.date(byAdding: .day, value: Int(pesticidePeriod), to: pesticideLastDate)
                plant.pesticideNextDate = nextPesticideDate
                
            case "2" :
                let nextPesticideDate = self.createPlantViewTableHandler.pesticideDatePicker.datePicker.calendar.date(byAdding: .month, value: Int(pesticidePeriod), to: pesticideLastDate)
                plant.pesticideNextDate = nextPesticideDate
            default:
                fatalError("404 - Interval")
            }
            
            
            do {
                try context.save()
            }catch{
                print("Deu ruim")
            }
        }
        
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
