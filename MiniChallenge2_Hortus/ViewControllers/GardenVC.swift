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
        //        cp.center = wateringProgressBar.center
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
            cell.plant = plantsCollection[indexPath.row]
            cell.parentVC = self
            cell.plantIndex = indexPath.row
            cell.collectionView = collectionView
            cell.plantId = plantsCollection[indexPath.row].id
            cell.plantName.text = plantsCollection[indexPath.row].name
            cell.wateringPeriod.text = String(plantsCollection[indexPath.row].wateringPeriod) + " " + plantsCollection[indexPath.row].wateringInterval!
            cell.wateringNumber = Int(plantsCollection[indexPath.row].wateringPeriod)
            cell.wateringTimer.text = cell.wateringPeriod.text //Mudar--------------------------------------<<<<
            cell.wateringInterval = plantsCollection[indexPath.row].wateringInterval
            cell.plantImage.image = loadImageFromDiskWith(fileName: plantsCollection[indexPath.row].image!)
//            cell.plantImage.layer.cornerRadius = cell.plantImage.frame.height/2
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
//            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(wateringTimer), userInfo: cell, repeats: true)
//            if Date() >= cell.nextWateringTime{
//                cell.wateringTimer.text = "HORA DE REGAR!"
//            }



//            cell.wateringPeriod = Int32(temp?.wateringPeriod.)
//            cell.plantImage = temp?.plantImage.image.
            return cell
        }

        return UICollectionViewCell()
    }

//    @objc func wateringTimer(cell : PlantCardCell){
//        DispatchQueue.main.async {
//            let nxtHour = Float(Calendar.current.component(.hour, from: cell.nextWateringTime))
//            let nxtMinute = Float(Calendar.current.component(.minute, from: cell.nextWateringTime)/100)
//            let nxtSecond = Float(Calendar.current.component(.second, from: cell.nextWateringTime)/10000)
//            let hour = Float(Calendar.current.component(.hour, from: Date()))
//            let minute = Float(Calendar.current.component(.minute, from: Date())/100)
//            let second = Float(Calendar.current.component(.second, from: Date())/10000)
//
//            let nxtTime = nxtHour + nxtMinute + nxtSecond
//            var crntTime = hour + minute + second
//            let intervaltime = nxtTime - crntTime
//
//            if(intervaltime >= 0){
//                crntTime -= 0.0001
//                cell.wateringTimer.text = String(crntTime)
//            }
//
//        }
//    }
//
//    @IBOutlet weak var collectionView: UICollectionView!

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
            // apagartyhujkmnbvfghjk
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
}






//  GardenVC.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 14/05/19.
//  Copyright © 2019 Hortus. All rights reserved.


//import Foundation
//import UIKit
//import CoreData
//
//class GardenVC : UITableViewController {
//
//
//    var context : NSManagedObjectContext?
//    var plant : Plant?
//    var log : Log?
//
//    var plantsCollection = [Plant]()
//
//    var timer = Timer()
//    var time: Float!
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //        cp.center = wateringProgressBar.center
//        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        self.create_cells()
//    }
//
////    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return plantsCollection.count
////    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.plantsCollection.count
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "PlantCardCell", for: indexPath) as? PlantCardCell {
//            cell.plant = plantsCollection[indexPath.row]
//            cell.parentVC = self
//            cell.plantIndex = indexPath.row
//            cell.tableView = tableView
//            cell.plantId = plantsCollection[indexPath.row].id
//            cell.plantName.text = plantsCollection[indexPath.row].name
//            cell.wateringPeriod.text = String(plantsCollection[indexPath.row].wateringPeriod) + " " + plantsCollection[indexPath.row].wateringInterval!
//            cell.wateringNumber = Int(plantsCollection[indexPath.row].wateringPeriod)
//            cell.wateringTimer.text = cell.wateringPeriod.text //Mudar--------------------------------------<<<<
//            cell.wateringInterval = plantsCollection[indexPath.row].wateringInterval
//            cell.plantImage.image = loadImageFromDiskWith(fileName: plantsCollection[indexPath.row].image!)
//            //            cell.plantImage.layer.cornerRadius = cell.plantImage.frame.height/2
//            cell.plantImage.layer.cornerRadius = 25
//            cell.plantImage.clipsToBounds = true
//            cell.plantImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//            cell.wateredTime = plantsCollection[indexPath.row].wateredTime as Date?
//            let formatter = DateFormatter()
//            formatter.dateFormat = "dd/MM/yyyy - HH:mm"
//            cell.wateringTimer.text = formatter.string(for: plantsCollection[indexPath.row].nextWateringTime!)
//            cell.lastWater.text = formatter.string(for: plantsCollection[indexPath.row].wateredTime!)
//            let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longTap(_:)))
//            cell.addGestureRecognizer(longPressGesture)
//            //            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(wateringTimer), userInfo: cell, repeats: true)
//            //            if Date() >= cell.nextWateringTime{
//            //                cell.wateringTimer.text = "HORA DE REGAR!"
//            //            }
//
//
//
//            //            cell.wateringPeriod = Int32(temp?.wateringPeriod.)
//            //            cell.plantImage = temp?.plantImage.image.
//            return cell
//        }
//
//        return UITableViewCell()
//    }
//
//    //    @objc func wateringTimer(cell : PlantCardCell){
//    //        DispatchQueue.main.async {
//    //            let nxtHour = Float(Calendar.current.component(.hour, from: cell.nextWateringTime))
//    //            let nxtMinute = Float(Calendar.current.component(.minute, from: cell.nextWateringTime)/100)
//    //            let nxtSecond = Float(Calendar.current.component(.second, from: cell.nextWateringTime)/10000)
//    //            let hour = Float(Calendar.current.component(.hour, from: Date()))
//    //            let minute = Float(Calendar.current.component(.minute, from: Date())/100)
//    //            let second = Float(Calendar.current.component(.second, from: Date())/10000)
//    //
//    //            let nxtTime = nxtHour + nxtMinute + nxtSecond
//    //            var crntTime = hour + minute + second
//    //            let intervaltime = nxtTime - crntTime
//    //
//    //            if(intervaltime >= 0){
//    //                crntTime -= 0.0001
//    //                cell.wateringTimer.text = String(crntTime)
//    //            }
//    //
//    //        }
//    //    }
//    //
//    //    @IBOutlet weak var collectionView: UICollectionView!
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 420
//    }
//
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
//
//    func create_cells(){
//        print("aaaa")
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
//        tableView.reloadData()
//    }
//
//    func showSimpleAlert(cell:PlantCardCell) {
//        let alert = UIAlertController(title: "Apagar planta", message: "Você deseja mesmo apagar essa planta e todos seus dados?", preferredStyle: .actionSheet)
//
//
//        alert.addAction(UIAlertAction(title: "Apagar", style: .destructive, handler: { (action) in
//            //apagar
//            self.plantsCollection.remove(at: cell.plantIndex!)
//            self.context?.delete(cell.plant!)
//            self.tableView.reloadData()
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
//}



