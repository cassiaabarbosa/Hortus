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
    var table = CreatePlantView()
    var createPlantViewTableHandler = CreatePlantViewTableHandler()
    var onDoneBlock:(()->Void)?

    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.parentVC = self
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

    @objc func cancelCreation(_ sender: Any) {
        self.dismiss(animated: true)
    }

    
    @objc func doneCreation(_ sender: Any) {
        table.savePlant()
        self.onDoneBlock?()
        self.dismiss(animated: true)
    }
        
    
    @objc func dismissAlertController() {
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
    
    
}

