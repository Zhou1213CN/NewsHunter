//
//  NewsListViewController.swift
//  NewsHunter
//
//  Created by Zheng Zhou on 2021/5/14.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortSegmentedControl: UISegmentedControl!
    
    var news = NewsData()
   
    var searchText = ""
    var sortByPopularity = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        configureSegmentedControl()
       
        tableView.delegate = self
        tableView.dataSource = self
        
        news.urlString = news.urlBase1 + searchText + news.urlBase2 + sortByPopularity + news.urlBase3
        news.getData{
            DispatchQueue.main.async {
               // self.navigationItem.title = "News Shown: \(self.news.articleArray.count)"
                self.sortTable()
            }
        }
        
    }
    
    func configureSegmentedControl(){
        let blueFontColor = [NSAttributedString.Key.foregroundColor : UIColor(named: "PrimaryColor") ?? UIColor.systemBlue]
        let whiteFontColor = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        sortSegmentedControl.setTitleTextAttributes(blueFontColor, for: .selected)
        sortSegmentedControl.setTitleTextAttributes(whiteFontColor, for: .normal)
        sortSegmentedControl.layer.borderColor = UIColor.white.cgColor
        sortSegmentedControl.layer.borderWidth = 1.0
    }
    func sortTable(){
        switch sortSegmentedControl.selectedSegmentIndex {
        case 0:
            news.articleArray.sort(by: {$0.title < $1.title} )
        case 1:
            news.articleArray.sort(by: {$0.publishedAt > $1.publishedAt} )
        default:
            print("This should never happen.")
        }
        tableView.reloadData()
    }
    
    @IBAction func segmentPressed(_ sender: UISegmentedControl) {
        sortTable()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail"{
            let destination = segue.destination as! NewsDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.article = news.articleArray[selectedIndexPath.row]
        }
    }
    
}

extension NewsListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.articleArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        cell.publishedAtLabel?.text = news.articleArray[indexPath.row].publishedAt
        cell.sourceLabel?.text = news.articleArray[indexPath.row].source.name
        cell.titleLabel?.text = news.articleArray[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

