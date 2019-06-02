//
//  TelaTableViewController.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 14/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//

import UIKit

class TelaTableViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier: "cell") as! Celula
        cel.label.text = "texto que eu quero"
        
        return cel
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
