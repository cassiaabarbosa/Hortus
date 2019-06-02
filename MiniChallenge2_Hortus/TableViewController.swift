//
//  TableViewController.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 14/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var logRegagem: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()}

 
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: performSegue(withIdentifier: "cell", sender: indexPath)
        
        return cell
    }
    
    
}
