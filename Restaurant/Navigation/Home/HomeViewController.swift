import UIKit

class HomeViewController: UITableViewController {
    
    var drinks: [Drink]?
    var foods: [Food]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
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
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        let detailsController = storyboard.instantiateViewController(withIdentifier: "detailsViewController") as! DetailsViewController
        if let drinks {
            detailsController.drink = drinks[indexPath.row]
        } else if let foods {
            detailsController.food = foods[indexPath.row]
        }
        navigationController?.navigationBar.tintColor = .orange
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    func setupUI() {
        let mapItem = UIBarButtonItem(
            image: UIImage(systemName: "mappin.circle"),
            style: .plain,
            target: self,
            action: #selector(mapItemActionHandler)
        )
        mapItem.tintColor = .orange
        navigationItem.leftBarButtonItem = mapItem
        
        let myProfileItem = UIBarButtonItem(
            image: UIImage(systemName: "person.circle"),
            style: .plain,
            target: self,
            action: #selector(myProfileActionHandler)
        )
        myProfileItem.tintColor = .orange
        navigationItem.rightBarButtonItem = myProfileItem
    }
}

extension HomeViewController {
    @objc func mapItemActionHandler() {
        let storyboard = UIStoryboard(name: "Map", bundle: nil)
        let mapVC = storyboard.instantiateViewController(withIdentifier: "mapViewController") as! MapViewController
        navigationController?.pushViewController(mapVC, animated: true)
    }
    
    @objc func myProfileActionHandler() {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let profileController = storyboard.instantiateViewController(withIdentifier: "profileController") as! ProfileController
        let navigationController = UINavigationController(rootViewController: profileController)
        present(navigationController, animated: true)
    }
}
