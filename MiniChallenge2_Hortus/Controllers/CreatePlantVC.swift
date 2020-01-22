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
    
    //var plantImage: UIImageView = UIImageView()
    //var plantName: UILabel = UILabel()
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
    
    var firstSectionpicker = UIPickerView()
    var firstSectiondatePicker = UIDatePicker()
    
    var secondSectionpicker = UIPickerView()
    var secondSectiondatePicker = UIDatePicker()
    
    var thirdSectionpicker = UIPickerView()
    var thirdSectionpickerDatePicker = UIDatePicker()
    
    var fourthSectionpicker = UIPickerView()
    var fourthSectionpickerDatePicker = UIDatePicker()
    
    
    var fifthSectionpicker = UIPickerView()
    var fifthSectionpickerDatePicker = UIDatePicker()
    
    
    var sixthSectionpicker = UIPickerView()
    var sixthSectionpickerDatePicker = UIDatePicker()
    
    
    var seventhSectionpicker = UIPickerView()
    var seventhSectionpickerDatePicker = UIDatePicker()
    
    var tableViewCells: [UITableViewCell] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        tableView.backgroundColor = .lightGray
        //tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        tableView.keyboardDismissMode = .onDrag
        
        
        
        pickerAddPhotoButton.delegate = self
        
        addInitailValue()
        createTableView()
        
        
        
        tableView.register(PhotoCreatePlantCell.self, forCellReuseIdentifier: photoCellId)
        tableView.register(TaskCreatePlantCell.self, forCellReuseIdentifier: taskCellId)
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
        return 100
    }
    
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.clear
        let titleLabel = UILabel(frame: CGRect(x:10,y: 5 ,width:350,height:150))
        titleLabel.numberOfLines = 0;
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont(name: "Montserrat-Regular", size: 12)
        titleLabel.text  = "Footer text here"
        vw.addSubview(titleLabel)
        return vw
    }

    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 100
        }
        return 0
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
                    if (firstSectionData[indexPath.row] is TaskInformation) {
                        if let cell = tableView.dequeueReusableCell(withIdentifier: taskCellId) as? TaskCreatePlantCell {
                            if let taskInformation = firstSectionData[indexPath.row] as? TaskInformation {
                                cell.taskInformation = taskInformation
                                return cell
                            }
                        }
                    }
                
                }else if indexPath.row == 1 {
                    if (firstSectionData[indexPath.row] is FrequencyInformation) {
                        if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                            if let frequencyInformation = firstSectionData[indexPath.row] as? FrequencyInformation {
                                cell.frequencyInformation = frequencyInformation
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
                }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                if (secondSectionData[indexPath.row] is TaskInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: taskCellId) as? TaskCreatePlantCell {
                        if let taskInformation = secondSectionData[indexPath.row] as? TaskInformation {
                            cell.taskInformation = taskInformation
                            return cell
                        }
                    }
                }
            
            }else if indexPath.row == 1 {
                if (secondSectionData[indexPath.row] is FrequencyInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                        if let frequencyInformation = secondSectionData[indexPath.row] as? FrequencyInformation {
                            cell.frequencyInformation = frequencyInformation
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
            }
        }else if indexPath.section == 3{
            if indexPath.row == 0 {
                if (thirdSectionData[indexPath.row] is TaskInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: taskCellId) as? TaskCreatePlantCell {
                        if let taskInformation = thirdSectionData[indexPath.row] as? TaskInformation {
                            cell.taskInformation = taskInformation
                            return cell
                        }
                    }
                }
            
            }else if indexPath.row == 1 {
                if (thirdSectionData[indexPath.row] is FrequencyInformation) {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                        if let frequencyInformation = thirdSectionData[indexPath.row] as? FrequencyInformation {
                            cell.frequencyInformation = frequencyInformation
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
            }
        }else if indexPath.section == 4 {
                   if indexPath.row == 0 {
                       if (fourthSectionData[indexPath.row] is TaskInformation) {
                           if let cell = tableView.dequeueReusableCell(withIdentifier: taskCellId) as? TaskCreatePlantCell {
                               if let taskInformation = fourthSectionData[indexPath.row] as? TaskInformation {
                                   cell.taskInformation = taskInformation
                                   return cell
                               }
                           }
                       }
                   
                   }else if indexPath.row == 1 {
                       if (fourthSectionData[indexPath.row] is FrequencyInformation) {
                           if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                               if let frequencyInformation = fourthSectionData[indexPath.row] as? FrequencyInformation {
                                   cell.frequencyInformation = frequencyInformation
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
                   }
               }else if indexPath.section == 5 {
                   if indexPath.row == 0 {
                       if (fifthSectionData[indexPath.row] is TaskInformation) {
                           if let cell = tableView.dequeueReusableCell(withIdentifier: taskCellId) as? TaskCreatePlantCell {
                               if let taskInformation = fifthSectionData[indexPath.row] as? TaskInformation {
                                   cell.taskInformation = taskInformation
                                   return cell
                               }
                           }
                       }
                   
                   }else if indexPath.row == 1 {
                       if (fifthSectionData[indexPath.row] is FrequencyInformation) {
                           if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                               if let frequencyInformation = fifthSectionData[indexPath.row] as? FrequencyInformation {
                                   cell.frequencyInformation = frequencyInformation
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
                   }
               }else if indexPath.section == 6 {
                   if indexPath.row == 0 {
                       if (sixthSectionData[indexPath.row] is TaskInformation) {
                           if let cell = tableView.dequeueReusableCell(withIdentifier: taskCellId) as? TaskCreatePlantCell {
                               if let taskInformation = sixthSectionData[indexPath.row] as? TaskInformation {
                                   cell.taskInformation = taskInformation
                                   return cell
                               }
                           }
                       }
                   
                   }else if indexPath.row == 1 {
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
                       if (seventhSectionData[indexPath.row] is TaskInformation) {
                           if let cell = tableView.dequeueReusableCell(withIdentifier: taskCellId) as? TaskCreatePlantCell {
                               if let taskInformation = seventhSectionData[indexPath.row] as? TaskInformation {
                                   cell.taskInformation = taskInformation
                                   return cell
                               }
                           }
                       }
                   
                   }else if indexPath.row == 1 {
                       if (seventhSectionData[indexPath.row] is FrequencyInformation) {
                           if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
                               if let frequencyInformation = sixthSectionData[indexPath.row] as? FrequencyInformation {
                                   cell.frequencyInformation = frequencyInformation
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
        if section == 0 {
            return 2
        }
        return 3
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }

    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                 return 400
            }else{
                return 50
            }
        }else{
            if indexPath.row == 0 {
                return 50
            }else {
                if self.tableView.indexPathForSelectedRow?.row == indexPath.row && tableView.indexPathForSelectedRow?.section == indexPath.section {
                    return 150;
                } else {
                    return 50;
                }
            }
            
        }
    }
    
    
    
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    

    func createTableView() {
        data.append(PhotoInformation(plantPhoto: #imageLiteral(resourceName: "AddFotoCompleto")))
        data.append(NameInformation(plantName: ""))
        
        firstSectionData.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Flower"), taskPeriod: "Floração"))
        firstSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de rega", plantFrequency: " ", picker: firstSectionpicker))
        firstSectionData.append(LastActionInformation(lastActionLabel: "Última rega", lastAction: " ", picker: firstSectiondatePicker))
        
        
        secondSectionData.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Harvest"), taskPeriod: "Colheita"))
        secondSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de colheita", plantFrequency: " ", picker: secondSectionpicker))
       secondSectionData.append(LastActionInformation(lastActionLabel: "Última colheita", lastAction: " ", picker: secondSectiondatePicker))
        
        
        thirdSectionData.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Sun"), taskPeriod: "Exposição solar"))
        thirdSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de rega", plantFrequency: " ", picker: thirdSectionpicker))
        thirdSectionData.append(LastActionInformation(lastActionLabel: "Última exposição solar", lastAction: " ", picker: thirdSectionpickerDatePicker))
        
        
        fourthSectionData.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Booster"), taskPeriod: "Fertilizantes"))
        fourthSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de fertilização", plantFrequency: " ", picker: fourthSectionpicker))
        fourthSectionData.append(LastActionInformation(lastActionLabel: "Última fertilização", lastAction: " ", picker: fourthSectionpickerDatePicker))
        
        
        fifthSectionData.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Drop"), taskPeriod: "Regagem"))
        fifthSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de rega", plantFrequency: " ", picker: fifthSectionpicker))
        fifthSectionData.append(LastActionInformation(lastActionLabel: "Última rega", lastAction: " ", picker: fifthSectionpickerDatePicker))
        
        
        sixthSectionData.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Scisor"), taskPeriod: "Poda"))
        sixthSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de poda", plantFrequency: " ", picker: sixthSectionpicker))
        sixthSectionData.append(LastActionInformation(lastActionLabel: "Última poda", lastAction: " ", picker: sixthSectionpickerDatePicker))
        
        seventhSectionData.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Pesticide"), taskPeriod: "Pesticidas"))
        seventhSectionData.append(FrequencyInformation(frequencyLabel: "Intervalo de pesticidas", plantFrequency: " ", picker: seventhSectionpicker))
        seventhSectionData.append(LastActionInformation(lastActionLabel: "Última aplicação de pesticidas", lastAction: " ", picker: seventhSectionpickerDatePicker))
        
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
            
        }
        
    }
        
    
    @objc func dismissAlertController(){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    

    
}

