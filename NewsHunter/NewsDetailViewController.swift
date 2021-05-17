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
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

         updateUserInterface()
        
        
       
    }
    
    func updateUserInterface(){
        titleLabel.text = article.title
        publishedAtTextField.text = article.publishedAt
        contentLabel.text = article.content
        urlTextField.text = article.url
        guard let url = URL(string: article.urlToImage ?? "") else {return}
        do {
            let data = try Data(contentsOf: url)
            self.imageView.image = UIImage(data: data)
        } catch {
            print("ERROR: Could not get image from url \(url)")
        }
    }
    
}
