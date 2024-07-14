import Foundation
import UIKit

final class CommentTableViewCell : UITableViewCell {
    
    @IBOutlet weak var userThumbnail: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userThumbnail.image = nil
        usernameLabel.text = nil
        commentLabel.text = nil
    }
}

extension CommentTableViewCell {
    
    func configure(with comment: Comment) {
        userThumbnail.contentMode = .scaleAspectFill
        userThumbnail.layer.cornerRadius = 30
        if let imageName = comment.userImage {
            userThumbnail.image = UIImage(named: imageName)
        } else {
            userThumbnail.image = UIImage(systemName: "person.circle")
        }
        usernameLabel.text = comment.username
        commentLabel.text = comment.review
    }
}
