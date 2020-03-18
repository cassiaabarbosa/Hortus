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
    
    let formatter = DateFormatter()
    
    
    override init() {
        formatter.dateFormat = "dd/MM/yyyy"
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        self.plant = parentVC?.plant
        setTasks()
        if let tasksCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: taskCellId, for: indexPath) as? TaskCollectionCell {
            tasksCollectionCell.setActionImage(name: self.actionImages[indexPath.row])
            tasksCollectionCell.setActionButtonText(text: actionButtonTexts[indexPath.row])
            tasksCollectionCell.actionButton.tag = indexPath.row
            tasksCollectionCell.setActionPeriod(string: period[indexPath.row] )
            tasksCollectionCell.setActionInterval(string: returnIntervalString(numero: interval[indexPath.row]) )
            tasksCollectionCell.setLastLabel(string: lastDate[indexPath.row] )
            tasksCollectionCell.setNextLabel(string: nextDate[indexPath.row] )
            tasksCollectionCell.actionButton.addTarget(self, action: #selector(self.plantAction(_:)), for: .touchUpInside)
            
            
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
        let size = CGSize(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.2)
        
        return size
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    func setTasks() {
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
    
    @objc func plantAction(_ sender: UIButton){
        switch sender.tag {
        case 0:
            updateFlowering()
        case 1:
            updateHarvesting()
        case 2:
            updateSunExposure()
        case 3:
            updateBooster()
        case 4:
            updateWatering()
        case 5:
            updatePruning()
        default:
            updatePesticide()
        }
        
    }
    
    
    func updateFlowering() {
        
        guard let plant = plant else { return }
        var dateComponent: Calendar.Component = .day
        plant.floweringLastDate = Date()
        
        switch plant.floweringInterval {
        case "Horas":
            dateComponent = .hour
        case "Dias":
            dateComponent = .day
        
        case "Meses":
            dateComponent = .month
        default:
            print("DD")
        }
        
        plant.floweringNextDate = Calendar.current.date(byAdding: dateComponent, value: Int(plant.floweringPeriod), to: Date())
        CoreDataManager.shared.saveContext()
        lastDate[0] = (formatter.string(for: plant.floweringLastDate ?? "-") ?? "-")
        nextDate[0] = (formatter.string(for: plant.floweringNextDate ?? "-") ?? "-")
        self.parentVC?.plantTasksCollectionView.reloadData()
    }
    
    
    func updateHarvesting() {
        guard let plant = plant else { return }
        var dateComponent: Calendar.Component = .day
        plant.harvestingLastDate = Date()
        
        switch plant.harvestingInterval {
        case "Horas":
            dateComponent = .hour
        case "Dias":
            dateComponent = .day
        
        case "Meses":
            dateComponent = .month
        default:
            print("DD")
        }
        
        plant.harvestingNextDate = Calendar.current.date(byAdding: dateComponent, value: Int(plant.floweringPeriod), to: Date())
        CoreDataManager.shared.saveContext()
        lastDate[0] = (formatter.string(for: plant.harvestingLastDate ?? "-") ?? "-")
        nextDate[0] = (formatter.string(for: plant.harvestingNextDate ?? "-") ?? "-")
        self.parentVC?.plantTasksCollectionView.reloadData()

    }
    
    
    func updateSunExposure(){
        guard let plant = plant else { return }
        var dateComponent: Calendar.Component = .day
        plant.sunExposureLastDate = Date()
        
        switch plant.sunExposureInterval {
        case "Horas":
            dateComponent = .hour
        case "Dias":
            dateComponent = .day
        
        case "Meses":
            dateComponent = .month
        default:
            print("DD")
        }
        
        plant.sunExposureNextDate = Calendar.current.date(byAdding: dateComponent, value: Int(plant.sunExposurePeriod), to: Date())
        CoreDataManager.shared.saveContext()
        lastDate[0] = (formatter.string(for: plant.sunExposureLastDate ?? "-") ?? "-")
        nextDate[0] = (formatter.string(for: plant.sunExposureNextDate ?? "-") ?? "-")
        self.parentVC?.plantTasksCollectionView.reloadData()

    }
    
    
    func updateBooster(){
        guard let plant = plant else { return }
        var dateComponent: Calendar.Component = .day
        plant.boosterLastDate = Date()
        
        switch plant.boosterInterval {
        case "Horas":
            dateComponent = .hour
        case "Dias":
            dateComponent = .day
        
        case "Meses":
            dateComponent = .month
        default:
            print("DD")
        }
        
        plant.boosterNextDate = Calendar.current.date(byAdding: dateComponent, value: Int(plant.boosterPeriod), to: Date())
        CoreDataManager.shared.saveContext()
        lastDate[0] = (formatter.string(for: plant.boosterLastDate ?? "-") ?? "-")
        nextDate[0] = (formatter.string(for: plant.boosterNextDate ?? "-") ?? "-")
        self.parentVC?.plantTasksCollectionView.reloadData()
    }
    
    
    func updateWatering(){
        guard let plant = plant else { return }
        var dateComponent: Calendar.Component = .day
        plant.wateringLastDate = Date()
        
        switch plant.wateringInterval {
        case "Horas":
            dateComponent = .hour
        case "Dias":
            dateComponent = .day
        
        case "Meses":
            dateComponent = .month
        default:
            print("DD")
        }
        
        plant.wateringNextDate = Calendar.current.date(byAdding: dateComponent, value: Int(plant.wateringPeriod), to: Date())
        CoreDataManager.shared.saveContext()
        lastDate[0] = (formatter.string(for: plant.wateringLastDate ?? "-") ?? "-")
        nextDate[0] = (formatter.string(for: plant.wateringNextDate ?? "-") ?? "-")
        self.parentVC?.plantTasksCollectionView.reloadData()
    }
    
    
    func updatePruning(){
        guard let plant = plant else { return }
        var dateComponent: Calendar.Component = .day
        plant.pruningLastDate = Date()
        
        switch plant.pruningInterval {
        case "Horas":
            dateComponent = .hour
        case "Dias":
            dateComponent = .day
        
        case "Meses":
            dateComponent = .month
        default:
            print("DD")
        }
        
        plant.pruningNextDate = Calendar.current.date(byAdding: dateComponent, value: Int(plant.wateringPeriod), to: Date())
        CoreDataManager.shared.saveContext()
        lastDate[0] = (formatter.string(for: plant.pruningLastDate ?? "-") ?? "-")
        nextDate[0] = (formatter.string(for: plant.pruningNextDate ?? "-") ?? "-")
        self.parentVC?.plantTasksCollectionView.reloadData()
    }
    
    
    func updatePesticide(){
        guard let plant = plant else { return }
        var dateComponent: Calendar.Component = .day
        plant.pesticideLastDate = Date()
        
        switch plant.pesticideInterval {
        case "Horas":
            dateComponent = .hour
        case "Dias":
            dateComponent = .day
        
        case "Meses":
            dateComponent = .month
        default:
            print("DD")
        }
        
        plant.pesticideNextDate = Calendar.current.date(byAdding: dateComponent, value: Int(plant.pesticidePeriod), to: Date())
        CoreDataManager.shared.saveContext()
        lastDate[0] = (formatter.string(for: plant.pesticideLastDate ?? "-") ?? "-")
        nextDate[0] = (formatter.string(for: plant.pesticideNextDate ?? "-") ?? "-")
        self.parentVC?.plantTasksCollectionView.reloadData()
    }
    
}
