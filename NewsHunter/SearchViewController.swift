//
//  SearchViewController.swift
//  NewsHunter
//
//  Created by Zheng Zhou on 2021/5/17.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var newsLabel: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var popularitySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var searchText = searchTextField.text!
        searchText = searchText.replacingOccurrences(of: "", with: "%20")
        let destination = segue.destination as! NewsListViewController
        destination.searchText = searchText
        
        var sortByPopularity = "sortBy="
        if popularitySwitch.isOn == true{
            sortByPopularity = "sortBy=popularity"
            let destination = segue.destination as! NewsListViewController
            destination.sortByPopularity = sortByPopularity
        }
        if popularitySwitch.isOn == false{
            let destination = segue.destination as! NewsListViewController
            destination.sortByPopularity = sortByPopularity
            
        }
         
    }

    

}
