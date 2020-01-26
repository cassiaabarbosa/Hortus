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


protocol PlantVCDelegate: class {
    func taskSelected(value: Int)
    func didSelect(value: Int)
    func delete(uuid: UUID) //funcão para apagar a planta 
}


class PlantVC: UIViewController {
    
    var plantImageView: PlantImageView!
    var plantTasksView: PlantTasksView!
    var collectionViewHandler: PlantVCCollectionHandler!
    
    //precisa colocar uma variável para colocar o nome da planta direto na navigation 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setPlantImageView()
        setPlantTasksView()
        self.view.backgroundColor = .cyan
        
    }
    
    
    func setPlantImageView() {
        
        plantImageView = PlantImageView(frame: .zero)
        self.view.addSubview(plantImageView)
        
        plantImageView.translatesAutoresizingMaskIntoConstraints = false
        
        plantImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        plantImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        plantImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        plantImageView.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 400).isActive = true 
    }
    
    
    func setPlantTasksView() {
        
//        plantTasksView = PlantTasksView(frame: .zero)
//        plantTasksView.plantVCDelegate = collectionViewHandler
//        
//        self.view.addSubview(plantTasksView)
//        
//        plantTasksView.translatesAutoresizingMaskIntoConstraints = false
//        plantTasksView.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
//        plantTasksView.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
//        plantTasksView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
//        plantTasksView.topAnchor.constraint(equalTo: plantImageView.bottomAnchor, constant: 20).isActive = true 
    }
}
