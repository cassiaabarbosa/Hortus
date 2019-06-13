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

class GardenVC : UICollectionViewController {


    var context : NSManagedObjectContext?
    var plant : Plant?
    var log : Log?

    var plantsCollection = [Plant]()

    var timer = Timer()
    var time: Float!


    override func viewDidLoad() {
        super.viewDidLoad()
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

    }

    override func viewWillAppear(_ animated: Bool) {
        self.create_cells()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.plantsCollection.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlantCardCell", for: indexPath) as? PlantCardCell {
            return makeCell(cell: cell, indexPath: indexPath)
        }

        return UICollectionViewCell()
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

    func create_cells(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Plant")
        request.returnsObjectsAsFaults = false
        if let context = context{
            do{
                let result = try context.fetch(request)
                plantsCollection = []
                for data in result as! [NSManagedObject]{
                    plantsCollection.append(data as! Plant)
                    print(data.value(forKey: "name") as! String)
                }
            }catch{
                fatalError("404 - Non Entity")
            }
        }
        collectionView.reloadData()
    }

    func showSimpleAlert(cell:PlantCardCell) {
        let alert = UIAlertController(title: "Apagar planta", message: "Você deseja mesmo apagar essa planta e todos seus dados?", preferredStyle: .actionSheet)


        alert.addAction(UIAlertAction(title: "Apagar", style: .destructive, handler: { (action) in
            //apagar
            self.plantsCollection.remove(at: cell.plantIndex!)
            self.context?.delete(cell.plant!)
            self.collectionView.reloadData()
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            appDelegate.saveContext()

        }))


        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.default, handler: { _ in }))
        self.present(alert, animated: true, completion: nil)
    }

    @objc func longTap (_ sender: UILongPressGestureRecognizer) {
        if let celula = sender.view as? PlantCardCell{
            if sender.state == .began{
                showSimpleAlert(cell: celula)
            }
        }
    }
    
    func makeCell(cell:PlantCardCell, indexPath:IndexPath)-> PlantCardCell{
        cell.plant = plantsCollection[indexPath.row]
        cell.parentVC = self
        cell.plantIndex = indexPath.row
        cell.collectionView = collectionView
        cell.plantId = plantsCollection[indexPath.row].id
        cell.plantName.text = plantsCollection[indexPath.row].name
        cell.wateringPeriod.text = String(plantsCollection[indexPath.row].wateringPeriod) + " " + plantsCollection[indexPath.row].wateringInterval!
        cell.wateringNumber = Int(plantsCollection[indexPath.row].wateringPeriod)
        cell.wateringTimer.text = cell.wateringPeriod.text
        cell.wateringInterval = plantsCollection[indexPath.row].wateringInterval
        cell.plantImage.image = loadImageFromDiskWith(fileName: plantsCollection[indexPath.row].image!)
        cell.layer.cornerRadius = 25
        cell.plantImage.layer.cornerRadius = 25
        cell.plantImage.clipsToBounds = true
        cell.plantImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cell.wateredTime = plantsCollection[indexPath.row].wateredTime as Date?
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy - HH:mm"
        cell.wateringTimer.text = formatter.string(for: plantsCollection[indexPath.row].nextWateringTime!)
        cell.lastWater.text = formatter.string(for: plantsCollection[indexPath.row].wateredTime!)
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longTap(_:)))
        cell.addGestureRecognizer(longPressGesture)
        return cell
    }
}
