import UIKit

class HomeViewController: UITableViewController {
    
    var drinks: [Drink]?
    var foods: [Food]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let drinks {
            return drinks.count
        } else if let foods {
            return foods.count
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let drinks {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: HomeTableViewCell.self),
                for: indexPath
            ) as! HomeTableViewCell
            
            cell.configure(with: drinks[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: HomeTableViewCell.self),
                for: indexPath
            ) as! HomeTableViewCell
            
            cell.configure(with: foods![indexPath.row])
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("selected row")
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let detailsController = storyboard.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        if let drinks {
            detailsController.drink = drinks[indexPath.row]
        } else if let foods {
            detailsController.food = foods[indexPath.row]
        }
        navigationController?.navigationBar.tintColor = .orange
        navigationController?.pushViewController(detailsController, animated: true)
    }
}

extension HomeViewController {
    func setupTableView() {
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
