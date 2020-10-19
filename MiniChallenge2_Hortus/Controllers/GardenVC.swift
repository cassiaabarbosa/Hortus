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
    var cellId: String = "ff"
    var onDoneBlock:(()->Void)?
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.plantCardView.plantCardCollectionView.reloadData()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }

        navigationController?.navigationBar.barTintColor = UIColor.App.navigation
        navigationController?.navigationBar.tintColor = UIColor.App.navigationTitle
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.App.navigationTitle]
        navigationItem.setRightBarButton(UIBarButtonItem(image: #imageLiteral(resourceName: "Add button"), style: .done, target: self, action: #selector(showsCreatePlantVC)), animated: true)

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
    
    func addingEmptyLabel() {
        self.onDoneBlock?()
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
            self.emptyLabel.isHidden = true
        }
        let navController = UINavigationController(rootViewController: nextVC)
        self.present(navController, animated: true, completion: nil)
    }
    
}

