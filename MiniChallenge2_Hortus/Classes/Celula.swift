//
//  Celula.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 14/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//

import UIKit

class Celula: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var label: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
