//
//  CreatePlantVC.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 14/05/19.
//  Copyright ©️ 2019 Hortus. All rights reserved.
//

import Foundation
import UIKit
import Photos

final class CreatePlantVC : UIViewController, UIImagePickerControllerDelegate {
	//MARK: Declarations
	@TemplateView private var tableView: UITableView
	
	private var viewModel: CreatePlantViewModel
//	var onDoneBlock:(()->Void)?
	
	//MARK: Init
	init(viewModel: CreatePlantViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupTableView()
		setupTableViewConstraints()
		setupViewControllerAttributes()
		setupNavigationControllerAttributes()
		tableView.keyboardDismissMode = .onDrag
		tableView.dataSource = self
		tableView.delegate = self
		
		func textFieldShouldReturn(textField: UITextField) -> Bool {
			textField.resignFirstResponder()
			return true
		}
	}
	
	// MARK: Tableview SetUP
	private func setupTableView () {
		tableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: CustomHeader.id)
	}

	// MARK: Tableview Constraints
	private func setupTableViewConstraints() {
		self.view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
			tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
			tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
			tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
		])
	}
	
	// MARK: Content Attributes
	private func setupViewControllerAttributes() {
		self.title = "Nova Planta"
	}
	
	private func setupNavigationControllerAttributes() {
		navigationController?.navigationBar.barTintColor = UIColor.App.navigation
		navigationController?.navigationBar.tintColor = UIColor.App.modalButton
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.App.navigationTitle]
		navigationController?.navigationBar.isTranslucent = false
		
		navigationItem.setRightBarButton(UIBarButtonItem(title: "Adicionar", style: .done, target: self, action: #selector(doneCreation(_:))), animated: true)
		navigationItem.setLeftBarButton(UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelCreation(_:))), animated: true)
		navigationItem.leftBarButtonItem?.tintColor = UIColor.App.delete
	}

	//MARK: REFATORAR
	//MARK: @objc
	@objc func cancelCreation(_ sender: Any) {
		self.dismiss(animated: true)
	}
	
	@objc func doneCreation(_ sender: Any) {
//		collectionView.savePlant()
//		self.onDoneBlock?()
		self.dismiss(animated: true)
	}
	
	@objc func dismissAlertController() {
		self.dismiss(animated: true, completion: nil)
	}
	
	//MARK: REFATORAR HARD
	func saveImage(imageName: String, image: UIImage) {
		
		guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
		
		let fileName = imageName
		let fileURL = documentsDirectory.appendingPathComponent(fileName)
		guard let data = image.jpegData(compressionQuality: 1) else { return }
		
		if FileManager.default.fileExists(atPath: fileURL.path) {
			do {
				try FileManager.default.removeItem(atPath: fileURL.path)
				print("Removed old image")
			} catch let removeError {
				print("couldn't remove file at path", removeError)
			}
		}
		
		do {
			try data.write(to: fileURL)
		} catch let error {
			print("error saving file with error", error)
		}
	}
	
	
}

//MARK: CollectionViewDataSource
extension CreatePlantVC: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section != 0{
			return 4
		}
		return 2
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		
		return viewModel.getNumberOfSections()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
//		if indexPath.section == 0 {
//			if indexPath.row == 0{
//					return plantPhoto
//			}else if indexPath.row == 1 {
//				return plantName
//			}
//		}else if indexPath.section == 1 {
//			if indexPath.row == 0 {
//				if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
//					return cell
//				}
//			}else if indexPath.row == 1{
//				return self.floweringPicker
//			}else if indexPath.row == 2{
//				if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
//					return cell
//				}
//			}else if indexPath.row == 3{
//				return floweringDatePicker
//			}
//		}else if indexPath.section == 2 {
//			if indexPath.row == 0 {
//				if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
//					return cell
//				}
//			}else if indexPath.row == 1{
//				return harvestingPicker
//			}else if indexPath.row == 2{
//				if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
//					return cell
//				}
//			}else if indexPath.row == 3{
//				return harvestingDatePicker
//			}
//		}else if indexPath.section == 3{
//			if indexPath.row == 0 {
//				if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
//					return cell
//				}
//			}else if indexPath.row == 1{
//				return sunExposurePicker
//			}else if indexPath.row == 2{
//				if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
//					return cell
//				}
//			}else if indexPath.row == 3{
//				return sunExposureDatePicker
//			}
//		}else if indexPath.section == 4{
//			if indexPath.row == 0 {
//				if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
//					return cell
//				}
//			}else if indexPath.row == 1{
//				return boosterPicker
//			}else if indexPath.row == 2{
//				if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
//					return cell
//				}
//			}else if indexPath.row == 3{
//				return boosterDatePicker
//			}
//		}else if indexPath.section == 5{
//			if indexPath.row == 0 {
//				if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
//					return cell
//				}
//			}else if indexPath.row == 1{
//				return wateringPicker
//			}else if indexPath.row == 2{
//				if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
//					return cell
//				}
//			}else if indexPath.row == 3{
//				return wateringDatePicker
//			}
//		}else if indexPath.section == 6{
//			if indexPath.row == 0 {
//				if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
//					return cell
//				}
//			}else if indexPath.row == 1{
//				return pruningPicker
//			}else if indexPath.row == 2{
//				if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
//					return cell
//				}
//			}else if indexPath.row == 3{
//				return pruningDatePicker
//			}
//		}else if indexPath.section == 7{
//			if indexPath.row == 0 {
//				if let cell = tableView.dequeueReusableCell(withIdentifier: frequencyCellId) as? FrequencyCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row])
//					return cell
//				}
//			}else if indexPath.row == 1{
//				return pesticidePicker
//			}else if indexPath.row == 2{
//				if let cell = tableView.dequeueReusableCell(withIdentifier: lastActionCellId) as? LastActionCell {
//					cell.setDefaultLabel(text: self.dafaultLabels[indexPath.row - 1])
//					return cell
//				}
//			}else if indexPath.row == 3{
//			   return pesticideDatePicker
//			}
//		}
		return UITableViewCell()
	}
}
//MARK: TableView Delegate
extension CreatePlantVC: UITableViewDelegate {
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeader.id) as? CustomHeader {
			header.setHeaderTitle(text:viewModel.getTitle(for: section).0)
			header.setHeaderImage(name: viewModel.getTitle(for: section).1)
			return header
		}
		return UIView()
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		
		if section == 0 {
			return 0
		}
		return 40
	}
}

