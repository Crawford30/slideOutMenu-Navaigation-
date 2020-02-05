//
//  MenuViewController.swift
//  SideMenu
//
//  Created by JOEL CRAWFORD on 2/5/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    let title_array = ["Home","About Us", "Avaliable Services", "Settings","Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menu_TableView.delegate = self
        menu_TableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title_array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        ///throws an exception===
        let cell = (tableView.dequeueReusableCell(withIdentifier: "menu_cell") as? MenuTableViewCell)! 
        cell.label_title.text = title_array[indexPath.row]
        return cell
        
        
        
    }
    
    
    @IBOutlet weak var menu_TableView: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
