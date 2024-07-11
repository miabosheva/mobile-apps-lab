import UIKit

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.image = nil
        titleLabel.text = nil
        descriptionLabel.text = nil
    }
}

extension HomeTableViewCell {
    
    func configure(with drink: Drink) {
        if let imageTitle = drink.image {
            cellImage.image = UIImage(named: imageTitle)
        } else {
            cellImage.image = UIImage(systemName: "photo")
        }
        titleLabel.text = drink.title
        descriptionLabel.text = drink.description
        typeLabel.text = "Type: \(drink.type)"
    }
}
