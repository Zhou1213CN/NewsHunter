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
    var newsofCollection: NewsCollection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if newsofCollection == nil {
            newsofCollection = NewsCollection()
        }
//        if article == nil{
//            article = Article(from: <#Decoder#>)
//        }
        
//        if article.title != nil{
//            updateUserInterface()
//        }
        
       
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
    
    func updateFromInterface(){
        newsofCollection.headline = titleLabel.text!
        newsofCollection.date = publishedAtTextField.text ?? ""
        newsofCollection.text = contentLabel.text!
        newsofCollection.image = self.imageView.image ?? UIImage()
        newsofCollection.link = urlTextField.text!
    }
    
    
    
   
}
