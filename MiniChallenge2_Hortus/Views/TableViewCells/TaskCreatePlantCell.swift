//
//  TableViewCell.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 17/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class TaskCreatePlantCell: UITableViewCell {
    
    var taskInformation : TaskInformation? {
        didSet {
            taskImage.image = taskInformation?.taskImage
            taskPeriodLabel.text = taskInformation?.taskPeriod
            taskNextActionLabel.text = taskInformation?.taskNextAction
        }
    }
    
    
    private let taskPeriodLabel : UILabel = {
    let taskPeriodLabel = UILabel()
    taskPeriodLabel.textColor = .black
    taskPeriodLabel.font = UIFont.systemFont(ofSize: 17)
    taskPeriodLabel.textAlignment = .left
    taskPeriodLabel.numberOfLines = 0
    return taskPeriodLabel
    }()
    
    
    private let taskNextActionLabel: UILabel = {
        let taskNextActionLabel = UILabel()
        taskNextActionLabel.textColor = .black
        taskNextActionLabel.font = UIFont.systemFont(ofSize: 17)
        taskNextActionLabel.textAlignment = .left
        taskNextActionLabel.numberOfLines = 0
        return taskNextActionLabel
    }()
    
    
    private let taskImage: UIImageView = {
        let taskImage = UIImageView(image: #imageLiteral(resourceName: "AddFotoPlanta"))
        taskImage.contentMode = .scaleAspectFit
        taskImage.clipsToBounds = true
        taskImage.translatesAutoresizingMaskIntoConstraints = false
        return taskImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(taskPeriodLabel)
        addSubview(taskImage)
        addSubview(taskNextActionLabel)
        
        taskImage.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        taskImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 50, enableInsets: false)
        
        taskPeriodLabel.anchor(top: topAnchor, left: taskImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        taskPeriodLabel.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        
        
        taskNextActionLabel.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        taskNextActionLabel.anchor(top: topAnchor, left: taskImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 150, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
    
    
}
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
}
