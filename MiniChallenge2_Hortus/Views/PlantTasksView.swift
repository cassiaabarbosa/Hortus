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
        
//    MARK: - Criação da Collection
    let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        plantTasksCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        plantTasksCollectionView.backgroundColor = .none
        plantTasksCollectionView.register(TaskCollectionCell.self, forCellWithReuseIdentifier: plantTaskCollectionCellId)
        
        self.addSubview(plantTasksCollectionView)
        plantTasksCollectionView.translatesAutoresizingMaskIntoConstraints = false
        plantTasksCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: -20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
}
