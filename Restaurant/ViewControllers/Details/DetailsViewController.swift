import Foundation
import UIKit

final class DetailsViewController : UIViewController {
    
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
    @IBAction func addACommentButtonTap() {
        let storyboard = UIStoryboard(name: "WriteComment", bundle: nil)
        
        let writeCommentVC = storyboard.instantiateViewController(withIdentifier: "writeCommentController") as! WriteCommentController
        
        let navigationController = UINavigationController(rootViewController: writeCommentVC)
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
            let objectCell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: DetailsShowTableViewCell.self),
                for: indexPath
            ) as! DetailsShowTableViewCell
            
            if let drink {
                objectCell.configure(with: drink)
            } else if let food {
                objectCell.configure(with: food)
            }
            return objectCell
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

// MARK: - Helper Methods

private extension DetailsViewController {
    func setupUI() {
        tableView.estimatedRowHeight = 1000
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        self.title = drink?.title ?? food?.title ?? ""
    }
}
