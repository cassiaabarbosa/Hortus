//
//  PlantCardView.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 29/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PlantCardView: UIView {
    
    var plantCardCollectionView: UICollectionView!
    var plantCardViewCollectionHandler = PlantCardViewCollectionHandler()
    let plantCardCellId: String = "plantCardCellId"
    var context : NSManagedObjectContext?
    var parentVC: GardenVC?
    var searchController: UISearchController?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        plantCardViewCollectionHandler.parentVC = self
        setPlantCard()
        self.backgroundColor = .white
        parentVC?.navigationItem.searchController = searchController
//        plantCardCollectionView.delegate = plantCardViewCollectionHandler
//        plantCardCollectionView.dataSource = plantCardViewCollectionHandler
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setPlantCard() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        plantCardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        plantCardCollectionView.clipsToBounds = false
        plantCardCollectionView.backgroundColor = .none
        plantCardCollectionView.register(PlantCardCell.self, forCellWithReuseIdentifier: plantCardCellId)
        plantCardCollectionView.showsVerticalScrollIndicator = false 
        
        self.addSubview(plantCardCollectionView)
        
        self.plantCardCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        plantCardCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        plantCardCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        plantCardCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        plantCardCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    
    func loadImageFromDiskWith(fileName: String) -> UIImage? {
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
            
        }
        return nil
    }

}
