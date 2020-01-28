//
//  PlantTasksViewColllectionHandler.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 25/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class PlantTasksViewCollectionHandler: NSObject, UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var actionImages: [String] = ["BlackFlower", "BlackHarvest", "BlackSun", "BlackBooster", "BlackDrop", "BlackScisor", "BlackPesticide"]
    
    var actionLabels: [String] = ["30 semanas","30 semanas","30 semanas","30 semanas","30 semanas","30 semanas","30 semanas"] //aqui serão as labels atualizadas do coreData
    
    var lastLabels: [String] = ["00/00/00","00/00/00","00/00/00","00/00/00","00/00/00","00/00/00","00/00/00"] //aqui serão as labels atualizadas do coreData
    
    var nextLabels: [String] = ["00/00/00","00/00/00","00/00/00","00/00/00","00/00/00","00/00/00","00/00/00"] //aqui serão as labels atualizadas do coreData
    
    var actionButtonImages: [String] = ["FloweringButton","HarvestingButton","SunExposureButton","BoosterButton","WateringButton","PruningButton"," PesticideButton"]
    
    var parentVC: PlantTasksView?
    var taskCellId: String = "TaskCellId"
    
    override init() {
        
    }
    
    func taskSelected(value: Int) {
//        parentVC?.plantVCDelegate.taskSelected(value: value)
    }
    
    func didSelect(value: Int) {
//        parentVC?.plantVCDelegate?.didSelect(value: value)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.App.selectedCell
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if let tasksCollectionCell = collectionView.cellForItem(at: indexPath) as? TaskCollectionCell {
            tasksCollectionCell.setActionButtonImage(name: actionButtonImages[indexPath.row])
            tasksCollectionCell.setActionButtonSizeShadow()

//            tasksCollectionCell.actionButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
//            tasksCollectionCell.actionButton.heightAnchor.constraint(equalToConstant: 300).isActive = true
            
        }
//        TODO: começar a primeira célula já selecionada 
//        TODO: fazer tudo voltar ao normal quando clicar outra célula 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let tasksCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: taskCellId, for: indexPath) as? TaskCollectionCell {
            tasksCollectionCell.setActionImage(name: self.actionImages[indexPath.row])
            tasksCollectionCell.setActionButtonImage(name: self.actionImages[indexPath.row])
            tasksCollectionCell.setLastLabel(string: lastLabels[indexPath.row])
            tasksCollectionCell.setNextLabel(string: nextLabels[indexPath.row])
            tasksCollectionCell.setActionLabel(string: actionLabels[indexPath.row])
            
            
            return tasksCollectionCell
        }
        
        return UICollectionViewCell()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //tamanho das células da Task
        let size = CGSize(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.2)

        return size
    }
    
    
    
}
