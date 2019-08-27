//
//  ViewController.swift
//  finctechAfter
//
//  Created by Денис Сидоренко on 06/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userImageButton: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userDescriptionTextView: UITextView!
    @IBOutlet weak var userEditButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userEditButton.layer.cornerRadius = 15
        userEditButton.layer.borderWidth = 1
        userEditButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userImageButton.layer.cornerRadius = userImageButton.frame.width / 2
        userImageView.layer.cornerRadius = userImageButton.frame.width / 2
    }
    
    
    @IBAction func choiceProfilePhoto(_ sender: Any) {
        showCameraMessage()
    }
    
    func showCameraMessage() {
        let showMessageController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        let galleryAction = UIAlertAction(title: "Галерея", style: .default, handler: {(action) in
            self.chooseImagePickerAction(source: .photoLibrary)
        })
        let cameraAction = UIAlertAction(title: "Камера", style: .default, handler: {(action) in
            self.chooseImagePickerAction(source: .camera)
        })
        let removeAction = UIAlertAction(title: "Удалить фото", style: .destructive) { (_) in
            self.userImageView.image = #imageLiteral(resourceName: "placeholder-user")
        }
        
        showMessageController.addAction(cameraAction)
        showMessageController.addAction(galleryAction)
        showMessageController.addAction(removeAction)
        showMessageController.addAction(cancelAction)
        
        present(showMessageController, animated: true, completion: nil)
    }
    
    func chooseImagePickerAction(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = source
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let sourceName = source == .camera ? "Камера" : "Галерея"
            let notAvailableAlert = UIAlertController(title: "\(sourceName) не доступна", message: "разрешите доступ в настройках приложения", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
            notAvailableAlert.addAction(okAction)
            present(notAvailableAlert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        userImageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}

