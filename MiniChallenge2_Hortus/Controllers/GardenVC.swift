//
//  GardenVC.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 14/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//

import Foundation
import UIKit

final class GardenVC : UIViewController, UITextViewDelegate {
	//MARK: Declarations
	private lazy var collectionView: UICollectionView = {
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		return collectionView
	}()
	private let viewModel: GardenViewModel
	
	
	//    var emptyLabel = UILabel()
//	var onDoneBlock:(()->Void)?
	
	
	//MARK: Init
	init(viewModel: GardenViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	//MARK: Lyfe cicle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupNavigationControllerAttributes()
		setupCollectionViewAttributes()
		setupCollectionViewConstraints()
		//        self.view.addSubview(emptyLabel)
		//
		//        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
		//        emptyLabel.centerYAnchor.constraint(equalTo: plantCardView.centerYAnchor).isActive = true
		//        emptyLabel.centerXAnchor.constraint(equalTo: plantCardView.centerXAnchor).isActive = true
		//        emptyLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
		//        emptyLabel.adjustsFontForContentSizeCategory = true
		//        emptyLabel.sizeToFit()
		//        emptyLabel.numberOfLines = 0
		//        emptyLabel.text = "Seu jardim está vazio. Clique na florzinha do canto direito superior para cadastrar uma planta."
		//        emptyLabel.textAlignment = .center
		//        emptyLabel.textColor = .lightGray
		//        emptyLabel.font = UIFont.systemFont(ofSize: 17)
		//        addingEmptyLabel()
	}
	
	// MARK: Setup View
	private func setupView() {
		self.view.backgroundColor = .white
		self.title = "Meu Jardim"
	}
	
	// MARK: Setup Navigation Controller
	private func setupNavigationControllerAttributes() {
		navigationController?.navigationBar.barTintColor = UIColor.App.navigation
		navigationController?.navigationBar.tintColor = UIColor.App.navigationTitle
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.App.navigationTitle]
		navigationItem.setRightBarButton(UIBarButtonItem(image: #imageLiteral(resourceName: "Add button"), style: .done, target: self, action: #selector(showsCreatePlantVC)), animated: true)
	}
	
	// MARK: Setup CollectionView Controller Attributes
	private func setupCollectionViewAttributes() {
		self.view.addSubview(collectionView)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(PlantCardCell.self, forCellWithReuseIdentifier: PlantCardCell.id)
		collectionView.backgroundColor = .none
	
	}
	
	// MARK: Setup CollectionView Controller Constraints
	private func setupCollectionViewConstraints() {
		let margins = view.safeAreaLayoutGuide
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalToSystemSpacingBelow: margins.topAnchor, multiplier: 2.5),
			collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
			collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
			collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
		])
	}
	
	
	private func addingEmptyLabel() {
		//        self.onDoneBlock?()
		//        if plantCardView.plantCardViewCollectionHandler.plants.count == 0 {
		//            emptyLabel.isHidden = false
		//        }else {
		//            emptyLabel.isHidden = true
		//        }
	}
	
	// MARK: @objc
	@objc func showsCreatePlantVC(_ sender: Any) {
		let coordinator: CreatePlantCoordinator = CreatePlantCoordinator(navigationController: self.navigationController ?? UINavigationController())
		coordinator.show(viewController: self)
	}
	
}

//MARK: CollectionViewDataSource
extension GardenVC: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlantCardCell.id, for: indexPath) as? PlantCardCell else {
			return UICollectionViewCell()
		}
		cell.changeCell(image: "Hortencia")
		cell.changeCell(name: "Cassia")
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
}

//MARK: CollectionViewDelegateFlowLayout
extension GardenVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
				return CGSize(width: ((self.view.frame.width) * 0.425), height: (self.view.frame.height) * 0.3)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 20
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		   return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
		}
}

//MARK: CollectionViewDelegate
extension GardenVC: UICollectionViewDelegate {
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
