//
//  ATMListViewController.swift
//  ATMInformation2
//
//  Created by Apple on 20/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import UIKit

class ATMListViewController: UITableViewController,DataSourceDelegate {
    var dataSource : (UITableViewDataSource & UITableViewDelegate)?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
        
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVc = segue.destination as! AtmDetailViewController
        destinationVc.atm = (sender as! AtmCell).atm
        destinationVc.mapManager = MapManager()
    }
  
}
