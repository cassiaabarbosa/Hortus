//
//  CreatePlantVC.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 14/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Photos

class CreatePlantVC : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate,  UIImagePickerControllerDelegate{
    
    @IBOutlet weak var fldName: UITextField!
    @IBOutlet weak var imgPlantImage: UIImageView!
    @IBOutlet weak var pkrWateringPeriod: UIPickerView!
    var pickerData: [[String]] = [[String]]()
    var hour: [String] = [String]()
    var period: [String] = ["horas", "dias", "meses"]
    @IBOutlet weak var btnAddPhoto: UIButton!
    var picker = UIImagePickerController()
    
    @IBOutlet weak var btnDone: UIBarButtonItem!
    var context : NSManagedObjectContext?
    var plant : Plant? = Plant()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        btnDone.action = #selector(btnDoneClicked(sender:))
        self.pkrWateringPeriod.delegate = self
        self.pkrWateringPeriod.dataSource = self
        for i in 1...30 {
            hour.append(String(i))
        }
        pickerData.append(hour)
        pickerData.append(period)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var row = pickerView.selectedRow(inComponent: 0)
        if component == 0 {
            return hour.count
        }else{
            return period.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(hour[row])
        }else {
            return period[row]
        }
    }
    
    @IBAction func btnAddPhotoClicked(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = false
            
            present(picker, animated: true, completion: nil)
            
        }
    }
    @IBAction func doneButtonAction(_ sender: Any) {
        print("CLICKED")
        if(fldName.text == ""){
            fldName.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.5)
        }else{
            create_plant()
            navigationController?.popViewController(animated: true)
        }
        
//        dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        self.dismiss(animated: true, completion: { () -> in })
        
        picker.dismiss(animated: true, completion: nil)
        
        
        guard let image = info[.originalImage] as? UIImage else {
             return print("Error")
            
        }
//        pickImageCallback?(image)
        imgPlantImage.image = image
//        imgPlantImage.layer.masksToBounds = true;
//        imgPlantImage.layer.cornerRadius = imgPlantImage.frame.height/2
        
    }
    
    func create_plant(){
        //Modo de instanciar um objeto do Core Data
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let plant = NSEntityDescription.insertNewObject(forEntityName: "Plant", into: context!) as! Plant
        plant.id = UUID().uuidString
        plant.name = fldName.text
        let temp:String = UUID().uuidString
        guard let imageName = temp as? String else { fatalError("Invalid Message Name!") }
        guard let image = imgPlantImage.image as? UIImage else { fatalError("Invalid Image") }
        saveImage(imageName: imageName, image: image)
        plant.image = imageName
        plant.wateringPeriod = Int32(hour[pkrWateringPeriod.selectedRow(inComponent: 0)])!
        plant.wateringInterval = period[pkrWateringPeriod.selectedRow(inComponent: 1)]
        plant.wateredTime = Date() as NSDate
        switch period[pkrWateringPeriod.selectedRow(inComponent: 1)] {
        case "horas":
            let futureDate = Calendar.current.date(byAdding: .hour, value: Int(hour[pkrWateringPeriod.selectedRow(inComponent: 0)])!, to: Date())
            plant.nextWateringTime = futureDate as! NSDate
        
        case "dias":
            let futureDate = Calendar.current.date(byAdding: .day, value: Int(hour[pkrWateringPeriod.selectedRow(inComponent: 0)])!, to: Date())
            plant.nextWateringTime = futureDate as! NSDate
        
        case "meses":
            let futureDate = Calendar.current.date(byAdding: .month, value: Int(hour[pkrWateringPeriod.selectedRow(inComponent: 0)])!, to: Date())
            plant.nextWateringTime = futureDate as! NSDate
        default:
            fatalError("404 - Interval")
        }
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        appDelegate.saveContext()
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
