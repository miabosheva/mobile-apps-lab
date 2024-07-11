//
//  DrinkDetailViewController.swift
//  Restaurant
//
//  Created by Mia on 7/11/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var objectImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var drink: Drink?
    var food: Food?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        if let drink {
            titleLabel.text = drink.title
            typeLabel.text = "Type of drink: \(drink.type)"
            descriptionLabel.text = drink.description
            if let imageName = drink.image {
                objectImage.image = UIImage(named: imageName)
            } else {
                objectImage.image = UIImage(systemName: "star")
            }
        } else if let food {
            titleLabel.text = food.title
            typeLabel.text = "Type of food: \(food.type)"
            descriptionLabel.text = food.description
            if let imageName = food.image {
                objectImage.image = UIImage(named: imageName)
            } else {
                objectImage.image = UIImage(systemName: "star")
            }
        }
    }
}
