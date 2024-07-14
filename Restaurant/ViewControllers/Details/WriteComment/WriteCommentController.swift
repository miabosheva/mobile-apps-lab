import Foundation
import UIKit

final class WriteCommentController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameInputView: UITextView!
    @IBOutlet weak var commentInputView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var viewContainerForCommentText: UIView!
    @IBOutlet weak var viewContainerForUsernameText: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Actions
    
    @IBAction func submitButtonTap() {
//        guard let show, let authInfo else { return }
//
//        let rating = ratingView.rating
//        let comment = textView.text ?? ""
//        let showid = show.id
//        
//        let parameters: [String : Any] = [
//            "rating" : rating,
//            "comment" : comment,
//            "show_id" : showid
//        ]
//        
//        animateSubmitButtonTap()
//        
//        AF
//          .request(
//            "https://tv-shows.infinum.academy/reviews",
//            method: .post,
//            parameters: parameters,
//            encoding: JSONEncoding.default,
//            headers: HTTPHeaders(authInfo.headers)
//          )
//          .validate()
//          .responseDecodable(of: ReviewSubmitResponse.self) { [weak self] dataResponse in
//              guard let self = self else { return }
//              switch dataResponse.result {
//              case .success(_):
//                  delegate?.submitReview()
//                  close()
//              case .failure(let error):
//                  print(error.localizedDescription)
//              }
//          }
    }
}

private extension WriteCommentController {
    
    // MARK: - Helper Methods
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
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
        self.title = "Write a Comment"
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
