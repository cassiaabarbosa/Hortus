//
//  PlantCardViewCollectionHandler.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 29/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit
import CoreData

class PlantCardViewCollectionHandler: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var parentVC: PlantCardView?
    let plantCardCellId: String = "plantCardCellId"
    
    let plantCard: PlantCardCell = PlantCardCell()
    var plants:[Plant] = []
    
    override init() {
        super.init()
        self.reloadPlants()
    }
    
    func reloadPlants() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Plant")
        request.returnsObjectsAsFaults = false
        let  context = CoreDataManager.shared.persistentContainer.viewContext
        do{
            let result = try context.fetch(request)
            self.plants = []
            for data in result as! [NSManagedObject]{
                self.plants.append(data as! Plant)
            }
        }catch{
            fatalError("404 - Non Entity")
        }
        
        self.parentVC?.plantCardCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let plantCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: plantCardCellId, for: indexPath) as? PlantCardCell {
            
            let plant = plants[indexPath.row]
            
            plantCardCell.namePlantLabel.text = plant.plantName
//            plantCardCell.plantImageView.image()
            // TODO - carregar os outros dados
            
            return plantCardCell
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //tamanho das células
        let size = CGSize(width: ((parentVC?.frame.width)! * 0.5) - 10, height: (parentVC?.frame.height)! * 0.3)

        return size
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //obter a celula que foi selecionada
        // pegar a planta que esta armazenada nela
        // chamar a proxima view passando essa planta como parametro
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    
}
