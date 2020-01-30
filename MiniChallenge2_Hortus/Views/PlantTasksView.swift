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

//protocol PlantTasksViewDelegate: class {
//    func taskSelected(value: Int)
//    func didSelect(value: Int)
//}

class PlantTasksView: UIView {
    
    var plantTasksCollectionView: UICollectionView!
    var plantTasksCollectionHandler: PlantTasksViewCollectionHandler?
    var plantTaskCollectionCellId: String = "TaskCellId"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        plantTasksCollectionHandler = PlantTasksViewCollectionHandler()
        plantTasksCollectionHandler?.parentVC = self
        
        self.backgroundColor = .none
        setPlantTask()
        
        plantTasksCollectionView.delegate = plantTasksCollectionHandler
        plantTasksCollectionView.dataSource = plantTasksCollectionHandler
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    }
    
    func setPlantTask(){
        
    let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        plantTasksCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        plantTasksCollectionView.clipsToBounds = false
        plantTasksCollectionView.backgroundColor = .none
        plantTasksCollectionView.register(TaskCollectionCell.self, forCellWithReuseIdentifier: plantTaskCollectionCellId)
        
        self.addSubview(plantTasksCollectionView)
        
        self.plantTasksCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        plantTasksCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        plantTasksCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        plantTasksCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        plantTasksCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
}
