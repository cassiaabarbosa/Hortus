//
//  CustomLabel.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 13/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }

    func initializeLabel() {
        self.numberOfLines = 5
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 17)
        self.textColor = UIColor.lightGray
        self.text = "Seu jardim está vazio. Clique na florzinha no canto superior direito para adicionar uma planta."
        self.frame = CGRect(x: 0, y: 0, width: 300, height: 100)

    }
    
}
