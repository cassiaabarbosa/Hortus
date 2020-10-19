//
//  PlantVC.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 23/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit
import Foundation
import CoreData
import Photos


class PlantVC: UIViewController {
    
    var plantImageView = PlantImageView(frame: .zero)
    var plantTasksView =  PlantTasksView(frame: .zero)
    var parentVC: GardenVC?
    var plant: Plant?
    var onDoneBlock:(()->Void)?
    
    required init(parent: GardenVC) {
        super.init(nibName: nil, bundle: nil)
        parentVC = parent
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPlantImageView()
        setPlantTasksView()
        self.view.backgroundColor = .white
        
        self.title = plant?.plantName
        navigationController?.navigationBar.barTintColor = UIColor.App.navigation
        navigationController?.navigationBar.tintColor = UIColor.App.navigationTitle
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.App.navigationTitle]
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deletePlant)), animated: true)
        navigationItem.rightBarButtonItem?.tintColor = UIColor.App.navigationTitle
        
    }
    
    
    
    func setPlantImageView() {
        
        self.view.addSubview(plantImageView)
        
        plantImageView.translatesAutoresizingMaskIntoConstraints = false
        plantImageView.plantImage.image = loadImageFromDiskWith(fileName: plant?.plantImage ?? " ")
        plantImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        plantImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        plantImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        plantImageView.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 400).isActive = true 
    }
    
    
    
    func setPlantTasksView() {
        plantTasksView.plant = self.plant
        self.view.addSubview(plantTasksView)
        
        plantTasksView.translatesAutoresizingMaskIntoConstraints = false
        plantTasksView.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        plantTasksView.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
        plantTasksView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
        plantTasksView.topAnchor.constraint(equalTo: plantImageView.bottomAnchor, constant: -20).isActive = true
    }
    
    
    
    @objc func  deletePlant() {
        CoreDataManager.shared.delete(plant: plant)
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Plant")
        request.returnsObjectsAsFaults = false
        let  context = CoreDataManager.shared.persistentContainer.viewContext
        do{
            let result = try context.fetch(request)
            parentVC?.plantCardView.plantCardViewCollectionHandler.plants = []
            for data in result as! [NSManagedObject]{
                parentVC?.plantCardView.plantCardViewCollectionHandler.plants.append(data as! Plant)
            }
        }catch{
            fatalError("404 - Non Entity")
        }
        self.parentVC?.plantCardView.plantCardViewCollectionHandler.reloadPlants()
        
        if self.parentVC?.plantCardView.plantCardViewCollectionHandler.plants.count == 0{
            parentVC?.emptyLabel.isHidden = false
        }
        self.dismiss(animated: true)
    }
    
    
    func loadImageFromDiskWith(fileName: String?) -> UIImage? {
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first {
            if let fileName = fileName {
                let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
                let image = UIImage(contentsOfFile: imageUrl.path)
                return image
            }
        }
        
        return nil
    }

    
}
