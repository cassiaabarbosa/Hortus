//
//  PlantCardViewCollectionHandler.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 29/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit
import CoreData

class PlantCardViewCollectionHandler: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {

    
    var parentVC: PlantCardView?
    let plantCardCellId: String = "plantCardCellId"
    
    let plantCard: PlantCardCell = PlantCardCell()
    var plants: [Plant] = []
    var plantsName: [String] = []
    
    var filtered:[String] = []
    var searchActive : Bool = false
    
    override init() {
        super.init()
        self.reloadPlants()
        plantNames()
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
        if searchActive{
            return filtered.count
        }
        
        return plants.count
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        parentVC?.parentVC?.dismiss(animated: true, completion: nil)
    }
    
//    func updateSearchResults(for searchController: UISearchController) {
//        let searchString = searchController.searchBar.text
//
//        for i in 0...plants.count {
//            filtered = plants[i].plantName?.filter({ (item) -> Bool in
//            }
////
//            let countryText: NSString = item as NSString
//
//            return (countryText.range(of: searchString!, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
//        })
//        collectionView.reloadData()
//
//    }
    
       
       func updateSearchResults(for searchController: UISearchController){
           let searchString = searchController.searchBar.text
    
                filtered = plantsName.filter({ (item) -> Bool in
                    let countryText: NSString = item as NSString
                    
                    return (countryText.range(of: searchString!, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
                })
                
                parentVC?.plantCardCollectionView.reloadData()
           

       }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
        parentVC?.plantCardCollectionView.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        parentVC?.plantCardCollectionView.reloadData()
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        if !searchActive {
            searchActive = true
            parentVC?.plantCardCollectionView.reloadData()
        }
        
        parentVC?.searchController?.searchBar.resignFirstResponder()
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let plantCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: plantCardCellId, for: indexPath) as? PlantCardCell {
            
            let plant = plants[indexPath.row]
            
            plantCardCell.plantIndex = indexPath.row
            plantCardCell.namePlantLabel.text = plant.plantName
            plantCardCell.plantImageView.image = loadImageFromDiskWith(fileName: plant.plantImage ?? " ")
            plantCardCell.plant = plant
            
            
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
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? PlantCardCell else {return}
        
//        pegando o gardenVC
        guard let vcontroller = self.parentVC?.parentVC else {return}
        let plantVC = PlantVC()
        let navController = UINavigationController(rootViewController: plantVC)
        plantVC.plant = cell.plant
        vcontroller.present(navController, animated: true, completion: nil)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
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
    
    func plantNames() {
        for i in 0..<plants.count{
            plantsName.append(plants[i].plantName ?? "_")
        }
    }

}
