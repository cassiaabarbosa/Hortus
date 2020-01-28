//
//  TaskCollectionCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 25/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class TaskCollectionCell: UICollectionViewCell {
    
    var actionImage: UIImageView!
    var defaultLabel: UILabel!
    var actionLabel: UILabel!
    var lastImage: UIImageView!
    var lastLabel: UILabel!
    var nextImage: UIImageView!
    var nextLabel: UILabel!
    var actionButton: UIButton!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setLayout()
        
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1
        actionButton.addTarget(self, action: #selector(plantAction(_:)), for: .touchUpInside)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setLayout() {
        //fazer o que não muda dentro da cell
        
        actionImage = UIImageView()
        defaultLabel = UILabel()
        defaultLabel.text = "A cada"
        defaultLabel.textColor = .black
        actionLabel = UILabel()
        actionLabel.textColor = .black
        lastImage = UIImageView()
        lastImage.image = #imageLiteral(resourceName: "HISTORICO")
        nextImage = UIImageView()
        nextImage.image = #imageLiteral(resourceName: "RELOGIO")
        lastLabel = UILabel()
        lastLabel.textColor = .black
        nextLabel = UILabel()
        nextLabel.textColor = .black
        actionButton = UIButton()
        actionButton.setImage(#imageLiteral(resourceName: "ActionButton"), for: .normal)
        
        self.backgroundColor = .lightGray
    
        contentView.addSubview(actionImage)
        contentView.addSubview(defaultLabel)
        contentView.addSubview(actionLabel)
        contentView.addSubview(lastImage)
        contentView.addSubview(lastLabel)
        contentView.addSubview(nextImage)
        contentView.addSubview(nextLabel)
        contentView.addSubview(actionButton)
        
        actionImage.translatesAutoresizingMaskIntoConstraints = false
        defaultLabel.translatesAutoresizingMaskIntoConstraints = false
        actionLabel.translatesAutoresizingMaskIntoConstraints = false
        lastImage.translatesAutoresizingMaskIntoConstraints = false
        actionImage.translatesAutoresizingMaskIntoConstraints = false
        lastLabel.translatesAutoresizingMaskIntoConstraints = false
        nextImage.translatesAutoresizingMaskIntoConstraints = false
        nextLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        actionImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        actionImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        actionImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        actionImage.bottomAnchor.constraint(equalTo: lastImage.topAnchor, constant: -30).isActive = true
        
        
        defaultLabel.leftAnchor.constraint(equalTo: actionImage.rightAnchor, constant: 10).isActive = true
        defaultLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        defaultLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        defaultLabel.bottomAnchor.constraint(equalTo: lastLabel.topAnchor, constant: -30).isActive = true
        
        
        actionLabel.leftAnchor.constraint(equalTo: defaultLabel.rightAnchor, constant: 0).isActive = true
        actionLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        actionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        actionLabel.bottomAnchor.constraint(equalTo: lastLabel.topAnchor, constant: -30).isActive = true
        
        
        lastImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lastImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        lastImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        lastImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        lastLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lastLabel.leftAnchor.constraint(equalTo: lastImage.rightAnchor, constant: 10).isActive = true
        lastLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        lastLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        nextImage.topAnchor.constraint(equalTo: lastImage.bottomAnchor, constant: 30).isActive = true
        nextImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        nextImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        nextImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        nextLabel.topAnchor.constraint(equalTo: lastLabel.bottomAnchor, constant: 30).isActive = true
        nextLabel.leftAnchor.constraint(equalTo: lastImage.rightAnchor, constant: 10).isActive = true
        nextLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    
        actionButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        actionButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        actionButton.isUserInteractionEnabled = false
    }

    
    
    func setActionButtonImage(name: String) {
        actionButton.setImage(UIImage(named: name), for: .normal)
    }
    
    
    
    func setActionImage(name: String){
        self.actionImage.image = UIImage(named: name)
    }
    
    
    
    func setActionLabel(string: String) {
        self.actionLabel.text = string
    }
    
    
    
    func setLastLabel(string: String) {
        self.lastLabel.text = string
    }
    
    
    
    func setNextLabel(string: String) {
        self.nextLabel.text = string
    }

    
    func setActionButtonSizeShadow(){
//        actionButton.widthAnchor.constraint(equalToConstant: 50).isActive = false
//        actionButton.heightAnchor.constraint(equalToConstant: 50).isActive = false
//        actionButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        actionButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
//        TODO: não muda o tamanho maior e da erro de constraint
        actionButton.layer.shadowColor = UIColor.black.cgColor
        actionButton.layer.masksToBounds = false
        actionButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        actionButton.layer.shadowRadius = 3.0
        actionButton.layer.shadowOpacity = 1
        actionButton.isUserInteractionEnabled = true  
    }
    
    
    
    @objc func plantAction(_ sender: UIButton){
//        TODO: cria uma action para atualizar as labels com as informações do CoreData
//        creio que tem que implementar essa função com protocol 
    }
}
