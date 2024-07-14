import Foundation
import UIKit

final class DetailsViewController : UIViewController, ModalViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properites
    
    var food: Food?
    var drink: Drink?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Actions
    
    func didDismissModalViewController() {
        if let food {
            if let loadedFood = UserDefaultsHelperMethods.loadFood(food.title) {
                self.food = loadedFood
            }
        } else if let drink {
            if let loadedDrink = UserDefaultsHelperMethods.loadDrink(drink.title) {
                self.drink = loadedDrink
            }
        }
        tableView.reloadData()
    }
    
    @IBAction func addACommentButtonTap() {
        let storyboard = UIStoryboard(name: "WriteComment", bundle: nil)
        
        let writeCommentVC = storyboard.instantiateViewController(withIdentifier: "writeCommentController") as! WriteCommentController
        
        if let drink {
            writeCommentVC.drinkTitle = drink.title
        } else if let food {
            writeCommentVC.foodTitle = food.title
        }
        
        let navigationController = UINavigationController(rootViewController: writeCommentVC)
        writeCommentVC.delegate = self
        present(navigationController, animated: true)
    }
}

extension DetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            if let drink {
                guard let comments = drink.comments else { return 0 }
                return comments.count
            } else {
                guard let comments = food?.comments else { return 0 }
                return comments.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let detailsCell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: DetailsShowTableViewCell.self),
                for: indexPath
            ) as! DetailsShowTableViewCell
            
            if let drink {
                detailsCell.configure(with: drink)
            } else if let food {
                detailsCell.configure(with: food)
            }
            return detailsCell
        }
        else {
            let reviewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentTableViewCell.self),
                                                           for: indexPath
            ) as! CommentTableViewCell
            
            if let drink, let comments = drink.comments {
                reviewCell.configure(with: comments[indexPath.row])
            } else if let food, let comments = food.comments {
                reviewCell.configure(with: comments[indexPath.row])
            }
            return reviewCell
        }
    }
}

private extension DetailsViewController {
    func setupUI() {
        tableView.estimatedRowHeight = 1000
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        self.title = drink?.title ?? food?.title ?? ""
    }
}

protocol ModalViewControllerDelegate: AnyObject {
    func didDismissModalViewController()
}

