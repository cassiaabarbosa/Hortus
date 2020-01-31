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
    
    
    var actionImages: [String] = ["BlackFlower", "BlackHarvest", "BlackSun", "BlackBooster", "BlackDrop", "BlackScissor", "BlackPesticide"]
    
    
    var period: [String]  = []
    
    var interval: [String]  = []
    
    var lastDate: [String]  = []
    
    var nextDate: [String]  = []
    
    
    
    var actionButtonTexts: [String] = ["Florescer","Colher","Expor à luz","Fertilizar","Regar","Podar","Dedetizar"]
    
    var parentVC: PlantTasksView?
    var plant: Plant?
    var taskCollectionCell: TaskCollectionCell = TaskCollectionCell()
    
    var taskCellId: String = "TaskCellId"
    
    override init() {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.App.selectedCell
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if let tasksCollectionCell = collectionView.cellForItem(at: indexPath) as? TaskCollectionCell {
            tasksCollectionCell.setActionButtonBorder(color: UIColor.App.borderColor.cgColor)
            tasksCollectionCell.setActionButtonSizeShadow()
            
        }
        //        TODO: começar a primeira célula já selecionada
        //        TODO: fazer tudo voltar ao normal quando clicar outra célula
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        self.plant = parentVC?.plant
        setTasks()
        if let tasksCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: taskCellId, for: indexPath) as? TaskCollectionCell {
            tasksCollectionCell.setActionImage(name: self.actionImages[indexPath.row])
            tasksCollectionCell.setActionButtonText(text: actionButtonTexts[indexPath.row])
            tasksCollectionCell.setActionPeriod(string: period[indexPath.row] )
            tasksCollectionCell.setActionInterval(string: returnIntervalString(numero: interval[indexPath.row]) )
            tasksCollectionCell.setLastLabel(string: lastDate[indexPath.row] )
            tasksCollectionCell.setNextLabel(string: nextDate[indexPath.row] )
            
            
            
            return tasksCollectionCell
        }
        
        return UICollectionViewCell()
    }
    
    
    func returnIntervalString(numero: String) -> String {
        switch numero {
        case "0":
            return "dias"
        case "1":
            return "semanas"
        case "2":
            return "meses"
        default:
            return "-"
        }
    }
        
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            //tamanho das células da Task
            let size = CGSize(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.2)
            
            return size
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 20
        }
        
    func setTasks() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        period.append(String(plant?.floweringPeriod ?? 0))
        period.append(String(plant?.harvestingPeriod ?? 0))
        period.append(String(plant?.sunExposurePeriod ?? 0))
        period.append(String(plant?.boosterPeriod ?? 0))
        period.append(String(plant?.wateringPeriod ?? 0))
        period.append(String(plant?.pruningPeriod ?? 0))
        period.append(String(plant?.pesticidePeriod ?? 0))
        
        interval.append(plant?.floweringInterval ?? "-")
        interval.append(plant?.harvestingInterval ?? "-")
        interval.append(plant?.sunExposureInterval ?? "-")
        interval.append(plant?.boosterInterval ?? "-")
        interval.append(plant?.wateringInterval ?? "-")
        interval.append(plant?.pruningInterval ?? "-")
        interval.append(plant?.pesticideInterval ?? "-")
        
        
        lastDate.append(formatter.string(for: plant?.floweringLastDate ?? "-") ?? "-")
        lastDate.append(formatter.string(for: plant?.harvestingLastDate ?? "-") ?? "-")
        lastDate.append(formatter.string(for: plant?.sunExposureLastDate ?? "-") ?? "-")
        lastDate.append(formatter.string(for: plant?.boosterLastDate ?? "-") ?? "-")
        lastDate.append(formatter.string(for: plant?.wateringLastDate ?? "-") ?? "-")
        lastDate.append(formatter.string(for: plant?.pruningLastDate ?? "-") ?? "-")
        lastDate.append(formatter.string(for: plant?.pesticideLastDate ?? "-") ?? "-")
        
        nextDate.append(formatter.string(for: plant?.floweringNextDate ?? "-") ?? "-")
        nextDate.append(formatter.string(for: plant?.harvestingNextDate ?? "-") ?? "-")
        nextDate.append(formatter.string(for: plant?.sunExposureNextDate ?? "-") ?? "-")
        nextDate.append(formatter.string(for: plant?.boosterNextDate ?? "-") ?? "-")
        nextDate.append(formatter.string(for: plant?.wateringNextDate ?? "-") ?? "-")
        nextDate.append(formatter.string(for: plant?.pruningNextDate ?? "-") ?? "-")
        nextDate.append(formatter.string(for: plant?.pesticideNextDate ?? "-") ?? "-")
        
    }
        
}
