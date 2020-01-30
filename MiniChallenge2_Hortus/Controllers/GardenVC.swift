//
//  GardenVC.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 14/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class GardenVC : UIViewController, UITextViewDelegate {
    
    
    var context : NSManagedObjectContext?
    var plantCardView = PlantCardView(frame: .zero)
    var emptyLabel = UILabel()
    
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    let searchBar: UISearchBar = UISearchBar(frame: (CGRect(x: 0, y: 64, width:UIScreen.main.bounds.width, height: 100)))
//    let searchController = UISearchController(searchResultsController: nil)
    
    
    
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let plantVC = PlantVC(plant: plantsCollection[indexPath.row])
//        navigationController?.pushViewController(plantVC, animated: true)
//        
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//
//        return CGSize(width: view.frame.width, height: 20)
//    }
    
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellId, for: indexPath)
//            header.addSubview(searchBar)
//            searchBar.translatesAutoresizingMaskIntoConstraints = false
//            searchBar.leftAnchor.constraint(equalTo: header.leftAnchor).isActive = true
//            searchBar.rightAnchor.constraint(equalTo: header.rightAnchor).isActive = true
//            searchBar.topAnchor.constraint(equalTo: header.topAnchor).isActive = true
//            searchBar.bottomAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
//        return header
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.plantCardView.plantCardCollectionView.reloadData()
        print(HortusSingleton.shared.photo)
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        
        self.title = "Jardim"

        navigationController?.navigationBar.barTintColor = UIColor.App.navigation
        navigationController?.navigationBar.tintColor = UIColor.App.navigationTitle
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.App.navigationTitle]
        navigationItem.setRightBarButton(UIBarButtonItem(image: #imageLiteral(resourceName: "Add button"), style: .done, target: self, action: #selector(showsCreatePlantVC)), animated: true)
        
//        searchController.searchBar.delegate = self as? UISearchBarDelegate
//        searchController.hidesNavigationBarDuringPresentation = true
//        searchController.searchResultsUpdater = searchController as? UISearchResultsUpdating
//        searchController.obscuresBackgroundDuringPresentation = true
//        searchController.extendedLayoutIncludesOpaqueBars = true
//        searchController.searchBar.autocapitalizationType = .sentences
//        searchController.searchBar.isTranslucent = true
//        searchController.searchBar.searchBarStyle = .prominent
//        searchController.searchBar.sizeToFit()
//        navigationItem.hidesSearchBarWhenScrolling = true
        
        self.view.backgroundColor = .white
        
        setPlantCardView()
        self.view.addSubview(emptyLabel)
            
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyLabel.centerYAnchor.constraint(equalTo: plantCardView.centerYAnchor).isActive = true
        emptyLabel.centerXAnchor.constraint(equalTo: plantCardView.centerXAnchor).isActive = true
        emptyLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emptyLabel.adjustsFontForContentSizeCategory = true
        emptyLabel.sizeToFit()
        emptyLabel.numberOfLines = 0
        emptyLabel.text = "Seu jardim está vazio. Clique na florzinha do canto direito superior para cadastrar uma planta."
        emptyLabel.textAlignment = .center
        emptyLabel.textColor = .lightGray
        emptyLabel.font = UIFont.systemFont(ofSize: 17)
        
        addingEmptyLabel()
        
        
    }
    

    func setPlantCardView() {
        plantCardView.parentVC = self
        self.view.addSubview(plantCardView)
        plantCardView.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.safeAreaLayoutGuide
        plantCardView.topAnchor.constraint(equalToSystemSpacingBelow: margins.topAnchor, multiplier: 2.5).isActive = true
        plantCardView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        plantCardView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        plantCardView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }
    
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//    }
//
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        navigationItem.searchController = searchController
//    }


//    func loadImageFromDiskWith(fileName: String) -> UIImage? {
//
//        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
//
//        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
//        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
//
//        if let dirPath = paths.first {
//            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
//            let image = UIImage(contentsOfFile: imageUrl.path)
//            return image
//
//        }
//
//        return nil
//    }

    

    
    func addingEmptyLabel() {
        if plantCardView.plantCardViewCollectionHandler.plants.count == 0 {
            emptyLabel.isHidden = false
        }else {
            emptyLabel.isHidden = true
        }
    }
    
    
    @objc func showsCreatePlantVC(_ sender: Any) {
        let nextVC = CreatePlantVC()
        nextVC.onDoneBlock = {
            self.plantCardView.plantCardViewCollectionHandler.reloadPlants()
        }
        let navController = UINavigationController(rootViewController: nextVC)
        self.present(navController, animated: true, completion: nil)
    }
    
}

