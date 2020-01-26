//
//  PlantTasksViewColllectionHandler.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 25/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class PlantTasksViewCollectionHandler: NSObject, UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PlantTasksViewDelegate {
    
    
    var actionImages: [String] = ["Flower", "Harvest", "Sun", "Booster", "Drop", "Scisor", "Pesticide"]
    
    var actionLabels: [String] = [" "," "," "," "," "," "," "] //aqui serão as labels atualizadas do coreData
    
    var lastLabels: [String] = [" "," "," "," "," "," "," "] //aqui serão as labels atualizadas do coreData
    
    var nextLabels: [String] = [" "," "," "," "," "," "," "] //aqui serão as labels atualizadas do coreData
    
    var actionButtonImages: [String] = []
    
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

    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let tasksCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: taskCellId, for: indexPath) as? TaskCollectionCell {
            tasksCollectionCell.setActionImage(name: self.actionImages[indexPath.row])
            tasksCollectionCell.setActionButtonImage(name: actionButtonImages[indexPath.row])
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
        let size = CGSize(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.3)

        return size
    }
    
    
}
