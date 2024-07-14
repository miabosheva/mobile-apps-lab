import Foundation
import UIKit

final class DetailsShowTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var objectImage: UIImageView!
    @IBOutlet weak var noCommentsView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        objectImage.layer.cornerRadius = 10
        objectImage.layer.masksToBounds = true
        noCommentsView.isHidden = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionLabel.text = nil
        objectImage.image = nil
    }
}

extension DetailsShowTableViewCell {
    
    func configure(with object: Any) {
        objectImage.contentMode = .scaleAspectFill
        if let drink = object as? Drink {
            typeLabel.text = "Type of drink: \(drink.type)"
            descriptionLabel.text = drink.description
            if let imageName = drink.image {
                objectImage.image = UIImage(named: imageName)
            } else {
                objectImage.image = UIImage(systemName: "star")
            }
            guard drink.comments != nil else {
                noCommentsView.isHidden = false
                return
            }
            noCommentsView.isHidden = true
        } else if let food = object as? Food {
            typeLabel.text = "Type of food: \(food.type)"
            descriptionLabel.text = food.description
            if let imageName = food.image {
                objectImage.image = UIImage(named: imageName)
            } else {
                objectImage.image = UIImage(systemName: "star")
            }
            guard food.comments != nil else {
                noCommentsView.isHidden = false
                return
            }
            noCommentsView.isHidden = true
        }
    }
}
