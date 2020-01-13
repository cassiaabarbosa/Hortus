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

class GardenVC : UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var context : NSManagedObjectContext?
    var plant : Plant?
    var collectionview: UICollectionView!
    var cellId = "Cell"
    var plantsCollection = [Plant]()
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plantsCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PlantCardCell
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor.App.navigation
        navigationController?.navigationBar.tintColor = UIColor.App.navigationItens
        navigationItem.setRightBarButton(UIBarButtonItem(image: #imageLiteral(resourceName: "Add button"), style: .done, target: self, action: #selector(create_cells)), animated: true)
        
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 700)

        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(PlantCardCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = true
        collectionview.backgroundColor = UIColor.white
        self.view.addSubview(collectionview)

    }

    override func viewWillAppear(_ animated: Bool) {
        self.create_cells()
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

    @objc func create_cells(){
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
    }

    func showSimpleAlert(cell:PlantCardCell) {
        let alert = UIAlertController(title: "Apagar planta", message: "Você deseja mesmo apagar essa planta e todos seus dados?", preferredStyle: .actionSheet)


        alert.addAction(UIAlertAction(title: "Apagar", style: .destructive, handler: { (action) in
            self.plantsCollection.remove(at: cell.plantIndex!)
            self.context?.delete(cell.plant!)
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

