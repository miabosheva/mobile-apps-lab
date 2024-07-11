//
//  DrinksViewController.swift
//  Restaurant
//
//  Created by Mia on 7/10/24.
//

import UIKit

class HomeViewController: UITableViewController {
    
    private var drinks = ModelObjects().drinks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return drinks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
                    withIdentifier: String(describing: HomeTableViewCell.self),
                    for: indexPath
                ) as! HomeTableViewCell
                
        cell.configure(with: drinks[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            print("selected row")
//            let storyboard = UIStoryboard(name: "Details", bundle: nil)
//            let detailsController = storyboard.instantiateViewController(withIdentifier: "detailsController") as! DetailsViewController
//            detailsController.show = shows[indexPath.row]
//            navigationController?.pushViewController(detailsController, animated: true)
    }
}

extension HomeViewController {
    func setupTableView() {
        tableView.estimatedRowHeight = 110
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
