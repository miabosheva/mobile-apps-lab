import Foundation
import UIKit

final class WriteCommentController: UIViewController {
    
    @IBOutlet weak var usernameInputView: UITextView!
    @IBOutlet weak var commentInputView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var viewContainerForCommentText: UIView!
    @IBOutlet weak var viewContainerForUsernameText: UIView!
    
    var foodTitle: String?
    var drinkTitle: String?
    
    weak var delegate: ModalViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func submitButtonTap() {
        if let foodTitle {
            UserDefaultsHelperMethods.saveCommentForFood(foodTitle: foodTitle, comment: Comment(username: usernameInputView.text, review: commentInputView.text))
        } else if let drinkTitle {
            UserDefaultsHelperMethods.saveCommentForDrink(drinkTitle: drinkTitle, comment: Comment(username: usernameInputView.text, review: commentInputView.text))
        }
        self.usernameInputView.text = ""
        self.commentInputView.text = ""
        self.close()
    }
}

private extension WriteCommentController {
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.didDismissModalViewController()
    }
    
    func animateSubmitButtonTap() {
        let newTransform = CGAffineTransform(
            scaleX: 0.9,
            y: 0.9
        )

        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            options: [.curveEaseInOut, .autoreverse]) {
                self.submitButton.transform = newTransform

            } completion: { _ in
                self.submitButton.transform = .identity
            }
    }
  
    func setupUI() {
        submitButton.isEnabled = false
        self.title = "Write a Comment for: \(foodTitle ?? drinkTitle!)"
        viewContainerForCommentText.layer.cornerRadius = 10
        viewContainerForUsernameText.layer.cornerRadius = 10
        
        commentInputView.delegate = self
        usernameInputView.delegate = self
        
        let backButton: UIBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(close))
        backButton.tintColor = .orange
        navigationItem.leftBarButtonItem = backButton;
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension WriteCommentController: UITextViewDelegate {
    
    // MARK: - Placeholder function for textView
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        guard let currentText = textView.text else { return true }

        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)

        if updatedText.isEmpty {
            textView.text = ""
            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            submitButton.isEnabled = false
            return false
        }

        textView.textColor = .black
        if !commentInputView.text.isEmpty && !usernameInputView.text.isEmpty {
            submitButton.isEnabled = true
        }

        return true
    }

}
