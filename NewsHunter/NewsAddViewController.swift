//
//  NewsAddViewController.swift
//  NewsHunter
//
//  Created by Zheng Zhou on 2021/5/18.
//

import UIKit

class NewsAddViewController: UIViewController {

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateLabel: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var urlTextField: UITextField!
    
    var newsofCollection: NewsCollection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if newsofCollection == nil {
            newsofCollection = NewsCollection()
        }
        updateUserInterface()
    }
    
    func updateUserInterface(){
        titleTextField.text = newsofCollection.headline
        dateLabel.text = newsofCollection.date
        contentTextField.text = newsofCollection.text
        //imageView.image = NSDataAsset(name: "news1")
        urlTextField.text = newsofCollection.link
    }
    
    func updateFromInterface(){
        newsofCollection.headline = titleTextField.text!
        newsofCollection.date = dateLabel.text!
        newsofCollection.text = contentTextField.text ?? ""
        //imageView.image ??
       // newsofCollection.image = NSDataAsset(name: "news1") as! UIImage
        newsofCollection.link = urlTextField.text!
    }
    
    func leaveViewController(){
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else{
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        leaveViewController()
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        updateFromInterface()
        newsofCollection.saveData{ (success) in
            if success {
                self.leaveViewController()
            } else {
                self.oneButtonAlert(title: "Save Failed", message: "The data would not save to the class")
            }
        }
    }
    
//    func updateFromInterface(){
//        newsofCollection.headline = titleLabel.text!
//        newsofCollection.date = publishedAtTextField.text ?? ""
//        newsofCollection.text = contentLabel.text!
//        newsofCollection.image = self.imageView.image ?? UIImage()
//        newsofCollection.link = urlTextField.text!
//    }

    
}
