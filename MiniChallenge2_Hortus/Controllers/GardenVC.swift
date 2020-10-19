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
    
    var plantCardView = PlantCardView(frame: .zero)
    var emptyLabel = UILabel()
    var cellId: String = "ff"
    var onDoneBlock:(()->Void)?
    
	private let viewModel: CreatePlantViewModel
	
    required init(viewModel: CreatePlantViewModel) {
		self.viewModel = viewModel
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
//        let nextVC = CreatePlantVC(viewModel: <#T##CreatePlantViewModel#>)
//        nextVC.onDoneBlock = {
//            self.plantCardView.plantCardViewCollectionHandler.reloadPlants()
//            self.emptyLabel.isHidden = true
//        }
//        let navController = UINavigationController(rootViewController: nextVC)
//        self.present(navController, animated: true, completion: nil)
    }
    
}

//MARK: CollectionViewDataSource
extension CreatePlantVC: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlantCardCell.id, for: indexPath) as? PlantCardCell {
			return cell
		}
		return UICollectionViewCell()
	}
}

//MARK: CollectionViewDelegateFlowLayout
extension CreatePlantVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: ((self.view.frame.width) * 0.5) - 10, height: (self.view.frame.height) * 0.3)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 20
	}
}

//MARK: CollectionViewDelegate
extension CreatePlantVC: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//		guard let cell = collectionView.cellForItem(at: indexPath) as? PlantCardCell else {return}
//		guard let vcontroller = self.parentVC?.parentVC else {return}
//		
//		let plantVC = PlantVC(parent: parentVC!.parentVC!)
//		let navController = UINavigationController(rootViewController: plantVC)
//		plantVC.plant = cell.plant
//		vcontroller.present(navController, animated: true, completion: nil)
	}
}
