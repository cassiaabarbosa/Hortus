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

class GardenVC : UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextViewDelegate {
    
    
    var context : NSManagedObjectContext?
    //var plant : Plant?
    //var plantsCollection = [Plant]()
    var collectionview: UICollectionView!
    var cellId:String = "cellId"
    var emptyLabel = CustomLabel()
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//    let searchBar: UISearchBar = UISearchBar(frame: (CGRect(x: 0, y: 64, width:UIScreen.main.bounds.width, height: 100)))
//    let searchController = UISearchController(searchResultsController: nil)
    
    var plantName = UILabel()
    var plantImage = UIImageView()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PlantCardCell
        
//        let plantCardCellInformation = PlantCardCellInformation(plantName: plantName, plantImage: plantImage)
        
//        cell.plantCardCellInformation? = plantCardCellInformation
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 20)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    
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
//
        definesPresentationContext = false
        
        
        emptyLabel.center = self.view.center
        
        
        //context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: view.frame.width/2.2, height: 300)

        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(PlantCardCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = true
        collectionview.backgroundColor = UIColor.white
        
        self.view.addSubview(collectionview)
        self.view.addSubview(emptyLabel)
        //self.view.addSubview(searchBar)
        
        addingEmptyLabel()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
        self.create_cells()
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

    
    @objc func create_cells(){
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Plant")
//        request.returnsObjectsAsFaults = false
//        if let context = context{
//            do{
//                let result = try context.fetch(request)
//                plantsCollection = []
//                for data in result as! [NSManagedObject]{
//                    plantsCollection.append(data as! Plant)
//                    print(data.value(forKey: "name") as! String)
//                }
//            }catch{
//                fatalError("404 - Non Entity")
//            }
//        }
    }

    
    func addingEmptyLabel() {
        emptyLabel.isHidden = true
//        if (plantsCollection.count != 0) {
//            emptyLabel.isHidden = true
//        }else {
//            emptyLabel.isHidden = false
//        }
    }
    
    
    @objc func showsCreatePlantVC(_ sender: Any) {
        let nextVC = PlantVC()
//        let navController = UINavigationController(rootViewController: nextVC)
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
//        func showSimpleAlert(cell:PlantCardCell) {
    //        let alert = UIAlertController(title: "Apagar planta", message: "Você deseja mesmo apagar essa planta e todos seus dados?", preferredStyle: .actionSheet)
    //
    //
    //        alert.addAction(UIAlertAction(title: "Apagar", style: .destructive, handler: { (action) in
    //            self.plantsCollection.remove(at: cell.plantIndex!)
    //            self.context?.delete(cell.plant!)
    //            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    //            appDelegate.saveContext()
    //
    //        }))
    //
    //
    //        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.default, handler: { _ in }))
    //        self.present(alert, animated: true, completion: nil)
    //    }
    //
    //    @objc func longTap (_ sender: UILongPressGestureRecognizer) {
    //        if let celula = sender.view as? PlantCardCell{
    //            if sender.state == .began{
    //                showSimpleAlert(cell: celula)
    //            }
    //        }
    //
    //    }
    
}

