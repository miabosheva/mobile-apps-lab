import Foundation
import UIKit

final class ProfileController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        setupBackButton()
        setupUI()
    }
}

private extension ProfileController {
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupBackButton() {
        let backButton: UIBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(close))
        backButton.tintColor = .orange
        self.navigationItem.leftBarButtonItem = backButton;
    }
    
    func setupUI() {
        // get from userdefaults
        if let imageData = UserDefaults.standard.data(forKey: "profilePhoto") {
            profileImage.image = UIImage(data: imageData)
        } else {
            profileImage.image = UIImage(systemName: "planet")
        }
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.cornerRadius = 15
        usernameLabel.text = "miabosheva"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func storeImage(_ image: UIImage) {
        // store in userDefaults
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            UserDefaults.standard.set(imageData, forKey: "profilePhoto")
        }
    }
}

extension ProfileController {
    
    @IBAction func takeAPhoto(_ sender: UIButton){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera
            present(imagePickerController, animated: true, completion: nil)
        } else {
            print("camera not available")
        }
    }
}


extension ProfileController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func changeProfilePhoto(_ sender: UIButton){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.contentMode = .scaleAspectFill
            profileImage.image = pickedImage
            storeImage(pickedImage)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
