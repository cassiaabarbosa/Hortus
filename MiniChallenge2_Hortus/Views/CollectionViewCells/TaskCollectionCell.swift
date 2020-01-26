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
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setLayout() {
        //fazer o que não muda dentro da cell
        
        actionImage = UIImageView()
        defaultLabel = UILabel()
        defaultLabel.text = "A cada "
        actionLabel = UILabel()
        lastImage = UIImageView()
        lastImage.image = #imageLiteral(resourceName: "HISTORICO")
        nextImage = UIImageView()
        nextImage.image = #imageLiteral(resourceName: "RELOGIO")
        lastLabel = UILabel()
        nextLabel = UILabel()
        actionButton = UIButton()
        
    
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
        
        actionImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        actionImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        actionImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        actionImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        defaultLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        defaultLabel.leftAnchor.constraint(equalTo: actionImage.leftAnchor, constant: 10).isActive = true
        defaultLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        defaultLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        actionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        actionLabel.leftAnchor.constraint(equalTo: defaultLabel.rightAnchor, constant: 0).isActive = true
        actionLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        actionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        
        lastImage.topAnchor.constraint(equalTo: actionImage.bottomAnchor, constant: 30).isActive = true
        lastImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        lastImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        lastImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        lastLabel.topAnchor.constraint(equalTo: actionLabel.topAnchor, constant: 10).isActive = true
        lastLabel.leftAnchor.constraint(equalTo: actionLabel.rightAnchor, constant: 10).isActive = true
        lastLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        lastLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        nextImage.topAnchor.constraint(equalTo: lastImage.bottomAnchor, constant: 30).isActive = true
        nextImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        nextImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        nextImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        nextLabel.topAnchor.constraint(equalTo: lastLabel.topAnchor, constant: 10).isActive = true
        nextLabel.leftAnchor.constraint(equalTo: lastLabel.rightAnchor, constant: 10).isActive = true
        nextLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        nextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    
        actionButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        actionButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }

    
    
    func setActionButtonImage(name: String) {
        self.actionButton.setImage(UIImage(named: name), for: .normal)
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

}
