////
////  CreatePlantViewTableHandler.swift
////  MiniChallenge2_Hortus
////
////  Created by Cassia Aparecida Barbosa on 28/01/20.
////  Copyright © 2020 Hortus. All rights reserved.
////
//
//import UIKit
//
//class CreatePlantViewTableHandler: NSObject, UITableViewDelegate, UITableViewDataSource {
//    
//    let nameCellId: String = "nameCellId"
//    let photoCellId: String = "photoCellid"
//    let taskCellId: String = "taskCellId"
//    let frequencyCellId: String = "frequencyCellId"
//    let lastActionCellId: String = "lastActionCellId"
//    let pickerCellId: String = "pickerCellId"
//    let datePickerCellId: String = "datePickerCellId"
//     let customHeaderCellId: String = "customHeaderCellId"
//    
//    override init() {
//        
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        
//        return 8
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        if section != 0{
//                   return 4
//               }
//               return 2
//    
//    }
//    
//    
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 0
//        }
//        return 40
//    }
//    
//    
//    func tableView(_ tableView: UITableView,
//            viewForHeaderInSection section: Int) -> UIView? {
//        
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: customHeaderCellId) as? CustomHeader
//        headerView.title.text = headerView.titleForSection[section]
//        headerView.image.image = headerView.imageForSection[section]
//
//       return headerView
//    }
//    
//    
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            if indexPath.row == 0{
//                if let cell = tableView.dequeueReusableCell(withIdentifier: photoCellId) as? PhotoCreatePlantCell {
//                    if let photoInformation = data[indexPath.row] as? PhotoInformation {
//                        cell.photoInformation = photoInformation
//                        cell.addPhotoButtonClickedClosure = {[self] in
//                            let alert = UIAlertController(title: "Adicionar foto da Planta", message: nil, preferredStyle: .alert)
//                            
//                            alert.addAction(UIAlertAction(title: "Câmera", style: .default, handler: { (action) in
//                                if UIImagePickerController.isSourceTypeAvailable(.camera) {
//                                    self.pickerAddPhotoButton.delegate = self
//                                    self.pickerAddPhotoButton.sourceType = .camera
//                                    self.pickerAddPhotoButton.allowsEditing = false
//                                    self.present(self.pickerAddPhotoButton, animated: true, completion: nil)
//                                    
//                                }}))
//                            
//                            alert.addAction(UIAlertAction(title: "Galeria", style: UIAlertAction.Style.default, handler: { (action) in
//                                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//                                    self.pickerAddPhotoButton.delegate = self
//                                    self.pickerAddPhotoButton.sourceType = .photoLibrary
//                                    self.pickerAddPhotoButton.allowsEditing = false
//                                    self.present(self.pickerAddPhotoButton, animated: true, completion: nil)
//                                    
//                                }}))
//                            
//                            self.present(alert, animated: true) {
//                                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
//                                alert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
//                            }
//                        }
//                        return cell
//                    }
//                    
//                }
//                //                /////////////////////////////////////////////////
//            }else if indexPath.row == 1 {
//                if (data[indexPath.row] is NameInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: nameCellId) as? NameCreatePlantCell {
//                        return cell
//                    }
//                }
//            }
//        }else if indexPath.section == 1 {
//            if indexPath.row == 0 {
//                if (firstSectionData[indexPath.row] is FrequencyInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//                        if let frequencyInformation = firstSectionData[indexPath.row] as? FrequencyInformation {
//                            cell.frequencyInformation = frequencyInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 1{
//                if (firstSectionData[indexPath.row] is PickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
//                        if let pickerInformation = firstSectionData[indexPath.row] as? PickerInformation {
//                            cell.pickerInformation = pickerInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 2{
//                if (firstSectionData[indexPath.row] is LastActionInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//                        if let lastActionInformation = firstSectionData[indexPath.row] as? LastActionInformation {
//                            cell.lastActionInformation = lastActionInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }else if indexPath.row == 3{
//                if (firstSectionData[indexPath.row] is DatePickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
//                        if let datePickerInformation = firstSectionData[indexPath.row] as? DatePickerInformation {
//                            cell.datePickerInformation = datePickerInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }
//        } else if indexPath.section == 2 {
//            if indexPath.row == 0 {
//                if (secondSectionData[indexPath.row] is FrequencyInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//                        if let frequencyInformation = secondSectionData[indexPath.row] as? FrequencyInformation {
//                            cell.frequencyInformation = frequencyInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 1{
//                if (secondSectionData[indexPath.row] is PickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
//                        if let pickerInformation = secondSectionData[indexPath.row] as? PickerInformation {
//                            cell.pickerInformation = pickerInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 2{
//                if (secondSectionData[indexPath.row] is LastActionInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//                        if let lastActionInformation = secondSectionData[indexPath.row] as? LastActionInformation {
//                            cell.lastActionInformation = lastActionInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }else if indexPath.row == 3{
//                if (secondSectionData[indexPath.row] is DatePickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
//                        if let datePickerInformation = secondSectionData[indexPath.row] as? DatePickerInformation {
//                            cell.datePickerInformation = datePickerInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }
//        }else if indexPath.section == 3{
//            if indexPath.row == 0 {
//                if (thirdSectionData[indexPath.row] is FrequencyInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//                        if let frequencyInformation = thirdSectionData[indexPath.row] as? FrequencyInformation {
//                            cell.frequencyInformation = frequencyInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 1{
//                if (thirdSectionData[indexPath.row] is PickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
//                        if let pickerInformation = thirdSectionData[indexPath.row] as? PickerInformation {
//                            cell.pickerInformation = pickerInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 2{
//                if (thirdSectionData[indexPath.row] is LastActionInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//                        if let lastActionInformation = thirdSectionData[indexPath.row] as? LastActionInformation {
//                            cell.lastActionInformation = lastActionInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }else if indexPath.row == 3{
//                if (thirdSectionData[indexPath.row] is DatePickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
//                        if let datePickerInformation = thirdSectionData[indexPath.row] as? DatePickerInformation {
//                            cell.datePickerInformation = datePickerInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }
//        }else if indexPath.section == 4 {
//            if indexPath.row == 0 {
//                if (fourthSectionData[indexPath.row] is FrequencyInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//                        if let frequencyInformation = fourthSectionData[indexPath.row] as? FrequencyInformation {
//                            cell.frequencyInformation = frequencyInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 1{
//                if (fourthSectionData[indexPath.row] is PickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
//                        if let pickerInformation = fourthSectionData[indexPath.row] as? PickerInformation {
//                            cell.pickerInformation = pickerInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 2{
//                if (fourthSectionData[indexPath.row] is LastActionInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//                        if let lastActionInformation = fourthSectionData[indexPath.row] as? LastActionInformation {
//                            cell.lastActionInformation = lastActionInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }else if indexPath.row == 3{
//                if (fourthSectionData[indexPath.row] is DatePickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
//                        if let datePickerInformation = fourthSectionData[indexPath.row] as? DatePickerInformation {
//                            cell.datePickerInformation = datePickerInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }
//        }else if indexPath.section == 5 {
//            if indexPath.row == 0 {
//                if (fifthSectionData[indexPath.row] is FrequencyInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//                        if let frequencyInformation = fifthSectionData[indexPath.row] as? FrequencyInformation {
//                            cell.frequencyInformation = frequencyInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 1{
//                if (fifthSectionData[indexPath.row] is PickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
//                        if let pickerInformation = fifthSectionData[indexPath.row] as? PickerInformation {
//                            cell.pickerInformation = pickerInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 2{
//                if (fifthSectionData[indexPath.row] is LastActionInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//                        if let lastActionInformation = fifthSectionData[indexPath.row] as? LastActionInformation {
//                            cell.lastActionInformation = lastActionInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }else if indexPath.row == 3{
//                if (fifthSectionData[indexPath.row] is DatePickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
//                        if let datePickerInformation = fifthSectionData[indexPath.row] as? DatePickerInformation {
//                            cell.datePickerInformation = datePickerInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }
//        }else if indexPath.section == 6 {
//            if indexPath.row == 0 {
//                if (sixthSectionData[indexPath.row] is FrequencyInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//                        if let frequencyInformation = sixthSectionData[indexPath.row] as? FrequencyInformation {
//                            cell.frequencyInformation = frequencyInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 1{
//                if (sixthSectionData[indexPath.row] is PickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
//                        if let pickerInformation = sixthSectionData[indexPath.row] as? PickerInformation {
//                            cell.pickerInformation = pickerInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 2{
//                if (sixthSectionData[indexPath.row] is LastActionInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//                        if let lastActionInformation = sixthSectionData[indexPath.row] as? LastActionInformation {
//                            cell.lastActionInformation = lastActionInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }else if indexPath.row == 3{
//                if (sixthSectionData[indexPath.row] is DatePickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
//                        if let datePickerInformation = sixthSectionData[indexPath.row] as? DatePickerInformation {
//                            cell.datePickerInformation = datePickerInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }
//        }else if indexPath.section == 7 {
//            if indexPath.row == 0 {
//                if (seventhSectionData[indexPath.row] is FrequencyInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//                        if let frequencyInformation = seventhSectionData[indexPath.row] as? FrequencyInformation {
//                            cell.frequencyInformation = frequencyInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 1{
//                if (seventhSectionData[indexPath.row] is PickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId) as? PickerCell {
//                        if let pickerInformation = seventhSectionData[indexPath.row] as? PickerInformation {
//                            cell.pickerInformation = pickerInformation
//                            return cell
//                        }
//                    }
//                }
//            }else if indexPath.row == 2{
//                if (seventhSectionData[indexPath.row] is LastActionInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//                        if let lastActionInformation = seventhSectionData[indexPath.row] as? LastActionInformation {
//                            cell.lastActionInformation = lastActionInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }else if indexPath.row == 3{
//                if (seventhSectionData[indexPath.row] is DatePickerInformation) {
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellId) as? DatePickerCell {
//                        if let datePickerInformation = seventhSectionData[indexPath.row] as? DatePickerInformation {
//                            cell.datePickerInformation = datePickerInformation
//                            return cell
//                        }
//                    }
//                }
//                
//            }
//        }
//        return UITableViewCell()
//    }
//    
//}
