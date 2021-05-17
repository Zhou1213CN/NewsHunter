//
//  NewsReactionViewController.swift
//  NewsHunter
//
//  Created by Zheng Zhou on 2021/5/18.
//

import UIKit

class NewsReactionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imagePickerController = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        
    }
    

    @IBAction func clickButtonPressed(_ sender: UIButton) {
        let originalImageFrame = imageView.frame
        let imageWidthShrink: CGFloat = 20
        let imageHeightShrink: CGFloat = 20
        let smallerImageFrame = CGRect(
            x: imageView.frame.origin.x + imageWidthShrink,
            y: imageView.frame.origin.y + imageHeightShrink,
            width: imageView.frame.width - (imageWidthShrink * 2),
            height: imageView.frame.height - (imageHeightShrink * 2))
        imageView.frame = smallerImageFrame
     //   playSound(name: "punchSound")
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, options: [], animations: {
            self.imageView.frame = originalImageFrame
        })
            }

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let originalImageFrame = imageView.frame
        let imageWidthShrink: CGFloat = 20
        let imageHeightShrink: CGFloat = 20
        let smallerImageFrame = CGRect(
            x: imageView.frame.origin.x + imageWidthShrink,
            y: imageView.frame.origin.y + imageHeightShrink,
            width: imageView.frame.width - (imageWidthShrink * 2),
            height: imageView.frame.height - (imageHeightShrink * 2))
        imageView.frame = smallerImageFrame
     //   playSound(name: "punchSound")
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, options: [], animations: {
            self.imageView.frame = originalImageFrame
        })
        
    }
    func showAlert(title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    
    @IBAction func photoOrCameraPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
               
               let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (_) in
                   self.accessPhotoLibrary()
               }
               let cameraAction = UIAlertAction(title: "Camera", style: .default) { (_) in
                   self.accessCamera()
               }
               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
               
               alertController.addAction(photoLibraryAction)
               alertController.addAction(cameraAction)
               alertController.addAction(cancelAction)
               
               present(alertController, animated: true, completion: nil)
    }
}

extension NewsReactionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func accessPhotoLibrary() {
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func accessCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerController.sourceType = .camera
            present(imagePickerController, animated: true, completion: nil)
        } else {
            showAlert(title: "Camera Not Available", message: "There is no camera available on this device.")
        }
    }
}
