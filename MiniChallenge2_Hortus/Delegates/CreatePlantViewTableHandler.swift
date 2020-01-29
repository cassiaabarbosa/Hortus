//
//  CreatePlantViewTableHandler.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 28/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//
//
import UIKit

class CreatePlantViewTableHandler: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    
    let nameCellId: String = "nameCellId"
    let photoCellId: String = "photoCellid"
    let taskCellId: String = "taskCellId"
    let frequencyCellId: String = "frequencyCellId"
    let lastActionCellId: String = "lastActionCellId"
    let customHeaderCellId: String = "customHeaderCellId"
    let pickerCellId: String = "pickerCellId"
    let datePickerCellId: String = "datePickerCellId"
    var parentVC: CreatePlantView?
    
    var floweringPickerVisible = false
    var floweringDatePickerVisible = false
    
    var harvestingPickerVisible = false
    var harvestingDatePickerVisible = false
    
    var sunExposurePickerVisible = false
    var sunExposureDatePickerVisible = false
    
    var boosterPickerVisible = false
    var boosterDatePickerVisible = false
    
    var wateringPickerVisible = false
    var wateringDatePickerVisible = false
    
    var pruningPickerVisible = false
    var pruningDatePickerVisible = false
    
    
    var pesticidePickerVisible = false
    var pesticideDatePickerVisible = false
    
    let dafaultLabels: [String] = ["Período:","Última:"]
    
    let titleForSection: [String] = ["","Floração", "Colheita","Exposição Solar", "Fertilizantes", "Rega", "Poda", "Pesticidas"]
    
    let imageForSection: [String] = ["","BlackFlower", "BlackHarvest", "BlackSun", "BlackBooster", "BlackDrop", "BlackScissor", "BlackPesticide"]
    
    
    
    override init() {
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section != 0{
            return 4
        }
        return 2
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
    
        return 8
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0
        }
        return 40
    }
    
    
    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {

        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: customHeaderCellId) as! CustomHeader
        header.setHeaderImage(name: imageForSection[section])
        header.setHeaderLabel(text: titleForSection[section])
            return header

    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0{
                    if let cell = tableView.dequeueReusableCell(withIdentifier: photoCellId) as? PhotoCreatePlantCell {
//                            cell.addPhotoButtonClickedClosure = {[self] in
//                                let alert = UIAlertController(title: "Adicionar foto da Planta", message: nil, preferredStyle: .alert)
//
//                                alert.addAction(UIAlertAction(title: "Câmera", style: .default, handler: { (action) in
//                                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
//                                        cell.pickerAddPhotoButton.delegate = self
//                                        cell.pickerAddPhotoButton.sourceType = .camera
//                                        cell.pickerAddPhotoButton.allowsEditing = false
//                                        self.present(self.pickerAddPhotoButton, animated: true, completion: nil)
//
//                                    }}))
//
//                                alert.addAction(UIAlertAction(title: "Galeria", style: UIAlertAction.Style.default, handler: { (action) in
//                                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//                                        self.pickerAddPhotoButton.delegate = self
//                                        self.pickerAddPhotoButton.sourceType = .photoLibrary
//                                        self.pickerAddPhotoButton.allowsEditing = false
//                                        self.present(self.pickerAddPhotoButton, animated: true, completion: nil)
//
//                                    }}))
//
//                                self.present(alert, animated: true) {
//                                    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
//                                    alert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
//                                }
//                            }
                            return cell
                    }
            }else if indexPath.row == 1 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: nameCellId) as? NameCreatePlantCell {
                    return cell
                }
            }
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
                    return cell
                }
            }else if indexPath.row == 1{
                if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                    return cell
                }
            }else if indexPath.row == 2{
                if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
                    return cell
                }
            }else if indexPath.row == 3{
                if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                    return cell
                }
            }
        }else if indexPath.section == 2 {
            if indexPath.row == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
                    return cell
                }
            }else if indexPath.row == 1{
                if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                    return cell
                }
            }else if indexPath.row == 2{
                if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
                    return cell
                }
            }else if indexPath.row == 3{
                if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                    return cell
                }
            }
        }else if indexPath.section == 3{
            if indexPath.row == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
                    return cell
                }
            }else if indexPath.row == 1{
                if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                    return cell
                }
            }else if indexPath.row == 2{
                if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
                    return cell
                }
            }else if indexPath.row == 3{
                if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                    return cell
                }
            }
        }else if indexPath.section == 4{
            if indexPath.row == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
                    return cell
                }
            }else if indexPath.row == 1{
                if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                    return cell
                }
            }else if indexPath.row == 2{
                if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
                    return cell
                }
            }else if indexPath.row == 3{
                if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                    return cell
                }
            }
        }else if indexPath.section == 5{
            if indexPath.row == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
                    return cell
                }
            }else if indexPath.row == 1{
                if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                    return cell
                }
            }else if indexPath.row == 2{
                if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
                    return cell
                }
            }else if indexPath.row == 3{
                if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                    return cell
                }
            }
        }else if indexPath.section == 6{
            if indexPath.row == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
                    return cell
                }
            }else if indexPath.row == 1{
                if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                    return cell
                }
            }else if indexPath.row == 2{
                if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
                    return cell
                }
            }else if indexPath.row == 3{
                if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                    return cell
                }
            }
        }else if indexPath.section == 7{
            if indexPath.row == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
                    return cell
                }
            }else if indexPath.row == 1{
                if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
                    return cell
                }
            }else if indexPath.row == 2{
                if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
                    cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
                    return cell
                }
            }else if indexPath.row == 3{
                if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            if indexPath.row == 0 {
                return 400
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
    
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    
    func showFloweringDatePicker () {
        
        floweringDatePickerVisible = !floweringDatePickerVisible
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    func showHarvestingPicker () {
        harvestingPickerVisible = !harvestingPickerVisible
    
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    
    func showHarvestingDatePicker () {
        
        harvestingDatePickerVisible = !harvestingDatePickerVisible
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    func showSunExposurePicker () {
        sunExposurePickerVisible = !sunExposurePickerVisible
    
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    
    func showSunExposureDatePicker () {
        
        sunExposureDatePickerVisible = !sunExposureDatePickerVisible
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    func showBoosterPicker () {
        boosterPickerVisible = !boosterPickerVisible
    
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    
    func showBoosterDatePicker () {
        
        boosterDatePickerVisible = !boosterDatePickerVisible
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    func showWateringPicker () {
        wateringPickerVisible = !wateringPickerVisible
    
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    
    func showWateringDatePicker () {
        
        wateringDatePickerVisible = !wateringDatePickerVisible
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    
    func showPruningPicker () {
        pruningPickerVisible = !pruningPickerVisible
    
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    
    func showPruningDatePicker () {
        
        pruningDatePickerVisible = !pruningDatePickerVisible
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    
    func showPesticidePicker () {
        pesticidePickerVisible = !pesticidePickerVisible
    
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
    
    func showPesticideDatePicker () {
        
        pesticideDatePickerVisible = !pesticideDatePickerVisible
        parentVC?.table.beginUpdates()
        parentVC?.table.endUpdates()
    }
    
}
