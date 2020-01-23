//
//  PlantCardCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 14/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//

import UIKit
import CoreData

class PlantCardCell: UICollectionViewCell {
    
    let namePlantLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.white
        label.text = "Rosa Vermelhakkkkk"
        label.textAlignment = .center
        label.backgroundColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    let plantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "red rose")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        addSubview(plantImageView)
        addSubview(namePlantLabel)
        
        plantImageView.layer.masksToBounds = true
        plantImageView.layer.cornerRadius = 20
        
        backgroundColor = .none
        
//        plantImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
//        plantImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
//        plantImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
//        plantImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        
        plantImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        namePlantLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30, enableInsets: false)
        
        
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 20
//        plantImageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
//        plantImageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
//        plantImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        //plantImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        //plantImageView.centerYAnchor.constraint(equalTo: self.tableView.centerYAnchor).isActive = true
        

        

        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    var plant:Plant?
//    var plantIndex:Int?
//    var parentVC:GardenVC?
//    var collectionView: UICollectionView?
//    var plantId: String?
//    @IBOutlet weak var plantName: UILabel!
//    @IBOutlet weak var wateringPeriod: UILabel!
//    public var nextWateringTime:Date!
//    public var wateredTime:Date!
//
//    @IBOutlet weak var wateringTimer: UILabel!
//    var wateringNumber: Int!
//    var wateringInterval: String!
//
//    @IBOutlet weak var plantImage: UIImageView!
//    var context : NSManagedObjectContext?
//
//
//    @IBOutlet weak var lastWater: UILabel!
//
//    @IBAction func waterPlant(_ sender: Any) {
//        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        guard let plant = plant else { return }
//        let alert = UIAlertController(title: "Regar Planta", message: "Você deseja mesmo regar sua planta?", preferredStyle: .actionSheet)
//        alert.addAction(UIAlertAction(title: "Regar", style: .default, handler: { (action) in
//            switch plant.wateringInterval {
//            case "horas":
//                let futureDate = Calendar.current.date(byAdding: .hour, value: self.wateringNumber, to: Date())
//                plant.wateredTime = Date() as? NSDate
//                plant.nextWateringTime = futureDate as! NSDate
//
//            case "dias":
//                let futureDate = Calendar.current.date(byAdding: .day, value: self.wateringNumber, to: Date())
//                plant.wateredTime = Date() as? NSDate
//                plant.nextWateringTime = futureDate as! NSDate
//
//            case "meses":
//                let futureDate = Calendar.current.date(byAdding: .month, value: self.wateringNumber, to: Date())
//                plant.wateredTime = Date() as? NSDate
//                plant.nextWateringTime = futureDate as! NSDate
//            default:
//                fatalError("404 - Interval")
//            }
//            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//            appDelegate.saveContext()
//            self.collectionView?.reloadData()
//
//        }))
//        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: { _ in }))
//        self.parentVC!.present(alert, animated: true, completion: nil)
//    }
//
//
//    @IBAction func deleteButton(_ sender: UIButton) {
//        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        context?.delete(self.plant!)
//        appDelegate.saveContext()
//        parentVC?.plantsCollection.remo
//
//        collectionView?.reloadData()
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Plant")
//        fetchRequest.predicate = NSPredicate(format: "id", plant.id!)
//
//        do{
//            let test = try context?.fetch(fetchRequest)
//            let objectToDelete = test[0] as! NSManagedObject
//            context?.delete(objectToDelete)
//        }
    //}
    
    
//    func createCell(plant:Plant) -> UICollectionViewCell{
//        plantName.text = plant.name
////        wateringPeriod.text = String(plant.wateringPeriod) + " horas"
////        plantImage.image = plant.image?.image
//        return self
//        
//    }
}
