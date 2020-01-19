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

class CreatePlantVC : UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate {
    
    var plantImage: UIImageView = UIImageView()
    var plantName: UILabel = UILabel()
    let nameCellId: String = "nameCellId"
    let photoCellId: String = "photoCellid"
    let taskCellId: String = "taskCellId"
    var data = Array<Any>()
    var pickerAddPhotoButton = UIImagePickerController()
    var tempPlantPhoto: UIImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        
        self.title = "Adicionar planta"
        navigationController?.navigationBar.barTintColor = UIColor.App.navigation
        navigationController?.navigationBar.tintColor = UIColor.App.modalButton
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.App.navigationTitle]
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Adicionar", style: .done, target: self, action: #selector(cancelCreation(_:))), animated: true)
        navigationItem.setLeftBarButton(UIBarButtonItem(title: "Cancelar", style: .plain , target: self, action: #selector(cancelCreation(_:))), animated: true)
        
        navigationItem.leftBarButtonItem?.tintColor = UIColor.App.delete
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        pickerAddPhotoButton.delegate = self
        
        createTableView()
        
        
        tableView.register(PhotoCreatePlantCell.self, forCellReuseIdentifier: photoCellId)
        tableView.register(TaskCreatePlantCell.self, forCellReuseIdentifier: taskCellId)
        tableView.register(NameCreatePlantCell.self, forCellReuseIdentifier: nameCellId)
        //Register cells
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
    
    
    
    func createTableView() {
        data.append(PhotoInformation(plantPhoto: #imageLiteral(resourceName: "AddFotoCompleto")))
        data.append(NameInformation(plantName: ""))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Flower"), taskPeriod: "Floresce cada 30 dias", taskNextAction: "Próxima: 00/00/00"))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Harvest"), taskPeriod: "A cada 30 dias", taskNextAction: ""))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Sun"), taskPeriod: "A cada 30 dias", taskNextAction: ""))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Booster"), taskPeriod: "A cada 30 dias", taskNextAction: ""))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Drop"), taskPeriod: "A cada 30 dias", taskNextAction: ""))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Scissor"), taskPeriod: "A cada 30 dias", taskNextAction: ""))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Pesticide"), taskPeriod: "A cada 30 dias", taskNextAction: ""))
        
        tableView.reloadData()
    }
    
    
    @objc func cancelCreation(_ sender: Any){
        
        self.dismiss(animated: true)
    }
    
    
    @objc func doneCreation(_ sender: Any){
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
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

