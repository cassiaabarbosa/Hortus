//
//  TaskCollectionCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 25/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class TaskCollectionCell: UICollectionViewCell {
    
    var actionImage = UIImageView()
    var defaultLabel = UILabel()
    var actionPeriod = UILabel()
    var actionInterval = UILabel()
    var lastImage = UIImageView()
    var lastLabel = UILabel()
    var nextImage = UIImageView()
    var nextLabel = UILabel()
    var actionButton = UIButton()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setLayout()
        
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setLayout() {
        defaultLabel.text = "A cada"
        defaultLabel.textColor = .black

        actionPeriod.textColor = .black
        actionInterval.textColor = .black
    
        lastImage.image = #imageLiteral(resourceName: "HISTORICO")
        
        nextImage.image = #imageLiteral(resourceName: "RELOGIO")
        
        lastLabel.textColor = .black
        
        nextLabel.textColor = .black
        
        actionButton.isUserInteractionEnabled = true
        actionButton.setTitleColor(.black, for: .normal)
        actionButton.backgroundColor = UIColor.App.selectedCell
        actionButton.layer.cornerRadius = 20
        
        
        self.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.8980392157, blue: 0.9019607843, alpha: 1)
    
        contentView.addSubview(actionImage)
        contentView.addSubview(defaultLabel)
        contentView.addSubview(actionInterval)
        contentView.addSubview(actionPeriod)
        contentView.addSubview(lastImage)
        contentView.addSubview(lastLabel)
        contentView.addSubview(nextImage)
        contentView.addSubview(nextLabel)
        contentView.addSubview(actionButton)
        
        actionImage.translatesAutoresizingMaskIntoConstraints = false
        defaultLabel.translatesAutoresizingMaskIntoConstraints = false
        actionPeriod.translatesAutoresizingMaskIntoConstraints = false
        actionInterval.translatesAutoresizingMaskIntoConstraints = false
        lastImage.translatesAutoresizingMaskIntoConstraints = false
        actionImage.translatesAutoresizingMaskIntoConstraints = false
        lastLabel.translatesAutoresizingMaskIntoConstraints = false
        nextImage.translatesAutoresizingMaskIntoConstraints = false
        nextLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        actionImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        actionImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        actionImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        actionImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        
        defaultLabel.leftAnchor.constraint(equalTo: actionImage.rightAnchor, constant: 20).isActive = true
        defaultLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        defaultLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        defaultLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        
        actionPeriod.leftAnchor.constraint(equalTo: defaultLabel.rightAnchor, constant: 10).isActive = true
        actionPeriod.widthAnchor.constraint(equalToConstant: 25).isActive = true
        actionPeriod.heightAnchor.constraint(equalToConstant: 30).isActive = true
        actionPeriod.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        actionInterval.leftAnchor.constraint(equalTo: actionPeriod.rightAnchor, constant: 0).isActive = true
        actionInterval.widthAnchor.constraint(equalToConstant: 100).isActive = true
        actionInterval.heightAnchor.constraint(equalToConstant: 30).isActive = true
        actionInterval.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        
        lastImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lastImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        lastImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        lastImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        lastLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lastLabel.leftAnchor.constraint(equalTo: lastImage.rightAnchor, constant: 20).isActive = true
        lastLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        lastLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        nextImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        nextImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        nextImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        nextImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        nextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        nextLabel.leftAnchor.constraint(equalTo: lastImage.rightAnchor, constant: 20).isActive = true
        nextLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    
        actionButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant:50).isActive = true
        actionButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    
    func setActionButtonText(text: String){
        actionButton.setTitle(text, for: .normal)
    }
    
    func setActionImage(name: String){
        self.actionImage.image = UIImage(named: name)
    }
    
    
    func setActionPeriod(string: String) {
        self.actionPeriod.text = string
    }
    
    
    func setActionInterval(string: String) {
        self.actionInterval.text = string
    }
    
    
    func setLastLabel(string: String) {
        self.lastLabel.text = string
    }
    
    
    
    func setNextLabel(string: String) {
        self.nextLabel.text = string
    }
    
}
