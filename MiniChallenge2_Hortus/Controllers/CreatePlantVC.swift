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
    var data = Array<Any>()
    var pickerAddPhotoButton = UIImagePickerController()
    
    
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
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        tableView.keyboardDismissMode = .onDrag
        
        
        pickerAddPhotoButton.delegate = self
        
        createTableView()
        
        
        
        tableView.register(PhotoCreatePlantCell.self, forCellReuseIdentifier: photoCellId)
        tableView.register(TaskCreatePlantCell.self, forCellReuseIdentifier: taskCellId)
        tableView.register(NameCreatePlantCell.self, forCellReuseIdentifier: nameCellId)
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
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        }else if (data[indexPath.row] is TaskInformation) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: taskCellId) as? TaskCreatePlantCell {
                if let taskInformation = data[indexPath.row] as? TaskInformation {
                    cell.taskInformation = taskInformation
                    return cell
                }
            }
        } else if (data[indexPath.row] is NameInformation) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: nameCellId) as? NameCreatePlantCell {
                return cell
            }
        }
        
        return UITableViewCell()
        
    }
    
    
    let indexPathOfCellYouWantToChange = IndexPath(row: 0, section: 0)
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      if indexPath == indexPathOfCellYouWantToChange {
        return 400
      } else {
        return 50
      }
        
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
        let floweringVC = FloweringVC()
         navigationController?.pushViewController(floweringVC, animated: true)
            
        }else if indexPath.row == 3 {
            let harvestingVC = HarvestingVC()
             navigationController?.pushViewController(harvestingVC, animated: true)
            
        }else if indexPath.row == 4 {
            let sunExposureVC = SunExposureVC()
             navigationController?.pushViewController(sunExposureVC, animated: true)
            
        }else if indexPath.row == 5 {
            let fertilizingVC = FertilizingVC()
             navigationController?.pushViewController(fertilizingVC, animated: true)
            
        }else if indexPath.row == 6 {
            let wateringVC = WateringVC()
             navigationController?.pushViewController(wateringVC, animated: true)
            
        }else if indexPath.row == 7 {
            let pruningVC = PruningVC()
             navigationController?.pushViewController(pruningVC, animated: true)
            
        }else if indexPath.row == 8 {
            let pesticideVC = PesticideVC()
             navigationController?.pushViewController(pesticideVC, animated: true)
    
        }
        
    }
    

    func createTableView() {
        data.append(PhotoInformation(plantPhoto: #imageLiteral(resourceName: "AddFotoCompleto")))
        data.append(NameInformation(plantName: ""))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Flower"), taskPeriod: "Floração"))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Harvest"), taskPeriod: "Colheita"))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Sun"), taskPeriod: "Exposição solar"))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Booster"), taskPeriod: "Fertilização"))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Drop"), taskPeriod: "Regagem"))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Scissor"), taskPeriod: "Poda"))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Pesticide"), taskPeriod: "Pesticidas"))
        
        tableView.reloadData()
        
    }
    
    
    @objc func cancelCreation(_ sender: Any){
        
        self.dismiss(animated: true)
        
    }
    
    
    @objc func doneCreation(_ sender: Any){
        //criar a célula
        
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

