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

class CreatePlantVC : UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource,  UIImagePickerControllerDelegate, UITextFieldDelegate{
    
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
        
        pickerAddPhotoButton.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
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
                                self.pickerAddPhotoButton.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                                self.pickerAddPhotoButton.sourceType = .camera
                                self.pickerAddPhotoButton.allowsEditing = false
                                self.present(self.pickerAddPhotoButton, animated: true, completion: nil)
                                
                            }}))
                        
                        alert.addAction(UIAlertAction(title: "Galeria", style: UIAlertAction.Style.default, handler: { (action) in
                            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                                self.pickerAddPhotoButton.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
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
        return UITableView.automaticDimension
      }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    
    
    func createTableView() {
        data.append(PhotoInformation(plantPhoto: #imageLiteral(resourceName: "hotencia")))
        data.append(NameInformation(plantName: ""))
        data.append(TaskInformation(taskImage: #imageLiteral(resourceName: "Flower"), taskPeriod: "A cada 30 dias", taskNextAction: "33333"))
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
        //PhotoCreatePlantCell.photo.image
        }
        
    
    @objc func dismissAlertController(){
        self.dismiss(animated: true, completion: nil)
    }
    
}



//    @IBOutlet weak var fldName: UITextField!
//    @IBOutlet weak var imgPlantImage: UIImageView!
//    @IBOutlet weak var pkrWateringPeriod: UIPickerView!
//    var pickerData: [[String]] = [[String]]()
//    var hour: [String] = [String]()
//    var period: [String] = ["horas", "dias", "meses"]
//    @IBOutlet weak var btnAddPhoto: UIButton!
//    var picker = UIImagePickerController()
//
//    @IBOutlet weak var btnDone: UIBarButtonItem!
//    var context : NSManagedObjectContext?
//    var plant : Plant? = Plant()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        btnDone.action = #selector(btnDoneClicked(sender:))
//        self.pkrWateringPeriod.delegate = self
//        self.pkrWateringPeriod.dataSource = self
//        for i in 1...30 {
//            hour.append(String(i))
//        }
//        pickerData.append(hour)
//        pickerData.append(period)
//
//
//    }
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 2
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        var row = pickerView.selectedRow(inComponent: 0)
//        if component == 0 {
//            return hour.count
//        }else{
//            return period.count
//        }
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if component == 0 {
//            return String(hour[row])
//        }else {
//            return period[row]
//        }
//    }
//
//    @IBAction func btnAddPhotoClicked(){
//        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
//            print("Button capture")
//
//            picker.delegate = self
//            picker.sourceType = .photoLibrary
//            picker.allowsEditing = false
//
//            present(picker, animated: true, completion: nil)
//
//        }
//    }
//    @IBAction func doneButtonAction(_ sender: Any) {
//        print("CLICKED")
//        if(fldName.text == ""){
//            fldName.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.5)
//        }else{
//            create_plant()
//            navigationController?.popViewController(animated: true)
//        }
//
////        dismiss(animated: true, completion: nil)
//    }
//
//    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
////        self.dismiss(animated: true, completion: { () -> in })
//
//        picker.dismiss(animated: true, completion: nil)
//
//
//        guard let image = info[.originalImage] as? UIImage else {
//             return print("Error")
//
//        }
////        pickImageCallback?(image)
//        imgPlantImage.image = image
////        imgPlantImage.layer.masksToBounds = true;
////        imgPlantImage.layer.cornerRadius = imgPlantImage.frame.height/2
//
//    }
//
//    func create_plant(){
//        //Modo de instanciar um objeto do Core Data
//        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let plant = NSEntityDescription.insertNewObject(forEntityName: "Plant", into: context!) as! Plant
//        plant.id = UUID().uuidString
//        plant.name = fldName.text
//        let temp:String = UUID().uuidString
//        guard let imageName = temp as? String else { fatalError("Invalid Message Name!") }
//        guard let image = imgPlantImage.image as? UIImage else { fatalError("Invalid Image") }
//        saveImage(imageName: imageName, image: image)
//        plant.image = imageName
//        plant.wateringPeriod = Int32(hour[pkrWateringPeriod.selectedRow(inComponent: 0)])!
//        plant.wateringInterval = period[pkrWateringPeriod.selectedRow(inComponent: 1)]
//        plant.wateredTime = Date() as NSDate
//        switch period[pkrWateringPeriod.selectedRow(inComponent: 1)] {
//        case "horas":
//            let futureDate = Calendar.current.date(byAdding: .hour, value: Int(hour[pkrWateringPeriod.selectedRow(inComponent: 0)])!, to: Date())
//            plant.nextWateringTime = futureDate as! NSDate
//
//        case "dias":
//            let futureDate = Calendar.current.date(byAdding: .day, value: Int(hour[pkrWateringPeriod.selectedRow(inComponent: 0)])!, to: Date())
//            plant.nextWateringTime = futureDate as! NSDate
//
//        case "meses":
//            let futureDate = Calendar.current.date(byAdding: .month, value: Int(hour[pkrWateringPeriod.selectedRow(inComponent: 0)])!, to: Date())
//            plant.nextWateringTime = futureDate as! NSDate
//        default:
//            fatalError("404 - Interval")
//        }
//        print(plant.wateredTime)
//        print(plant.nextWateringTime)
//
////        plant.wateringPeriod = Int32(Calendar.current.component(.hour, from: Date()))
//
//
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        appDelegate.saveContext()
//    }
//
//    func saveImage(imageName: String, image: UIImage) {
//
//        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//
//        let fileName = imageName
//        let fileURL = documentsDirectory.appendingPathComponent(fileName)
//        guard let data = image.jpegData(compressionQuality: 1) else { return }
//
//        //Checks if file exists, removes it if so.
//        if FileManager.default.fileExists(atPath: fileURL.path) {
//            do {
//                try FileManager.default.removeItem(atPath: fileURL.path)
//                print("Removed old image")
//            } catch let removeError {
//                print("couldn't remove file at path", removeError)
//            }
//
//        }
//
//        do {
//            try data.write(to: fileURL)
//        } catch let error {
//            print("error saving file with error", error)
//        }
//
//    }