//
//  NewsDetailViewController.swift
//  NewsHunter
//
//  Created by Zheng Zhou on 2021/5/14.
//

import UIKit


class NewsDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedAtTextField: UITextField!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var urlLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if article == nil{
//            article = Article()
//        }
        updateUserInterface()
       
    }
    func updateUserInterface(){
        titleLabel.text = article.title
        publishedAtTextField.text = article.publishedAt
        contentLabel.text = article.content
        urlLabel.text = article.url
        guard let url = URL(string: article.urlToImage ?? "") else {return}
        do {
            let data = try Data(contentsOf: url)
            self.imageView.image = UIImage(data: data)
        } catch {
            print("ERROR: Could not get image from url \(url)")
        }
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else{
            navigationController?.popViewController(animated: true)
        }
    }
    
    
   
}
