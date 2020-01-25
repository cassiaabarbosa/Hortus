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
//    var collectionViewHandler: PlantVCCollectionHandler!
    //precisa colocar uma variável para colocar o nome da planta direto na navigation 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPlantImageView()
        setPlantTasksView()
        
    }
    
    
    func setPlantImageView() {
        
        plantImageView = PlantImageView(frame: .zero)
        self.view.addSubview(plantImageView)
        
        plantImageView.backgroundColor = .cyan
        plantImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        plantImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        plantImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant:0).isActive = true
        plantImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        
    }
    
    
    func setPlantTasksView() {
        
        plantTasksView = PlantTasksView(frame: .zero)
        self.view.addSubview(plantTasksView)
        plantTasksView.plantVCDelegate =
//        plantTasksView.backgroundColor = .black
        plantTasksView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        plantTasksView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant:0).isActive = true
        plantTasksView.topAnchor.constraint(equalTo: plantImageView.bottomAnchor, constant: 20).isActive = true
        
        plantTasksView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        
    }
}
