//
//  PlantTasksView.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 25/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol PlantTasksViewDelegate: class {
    func taskSelected(value: Int)
    func didSelect(value: Int)
}

@IBDesignable
class PlantTasksView: UIView {
    
    var plantTasksCollectionView: UICollectionView!
    weak var plantVCDelegate: PlantVCDelegate!
    var plantTasksCollectionHandler: PlantTasksViewCollectionHandler?
    var plantTaskCollectionCellId: String = "PlantTaskCollectionCellId"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        plantTasksCollectionHandler = PlantTasksViewCollectionHandler()
        plantTasksCollectionHandler?.parentVC = self
        
        setPlantTask()
        
        plantTasksCollectionView.delegate = plantTasksCollectionHandler
        plantTasksCollectionView.dataSource = plantTasksCollectionHandler
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    }
    
    func setPlantTask(){
        
//    MARK: - Criação da Collection View 
    let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        plantTasksCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        plantTasksCollectionView.backgroundColor = .clear
        plantTasksCollectionView.register(TaskCollectionCell.self, forCellWithReuseIdentifier: plantTaskCollectionCellId)
        
        self.addSubview(plantTasksCollectionView)
        
        plantTasksCollectionView.translatesAutoresizingMaskIntoConstraints = false
        plantTasksCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        plantTasksCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        plantTasksCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        plantTasksCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
}
