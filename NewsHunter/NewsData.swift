//
//  NewsData.swift
//  NewsHunter
//
//  Created by Zheng Zhou on 2021/5/14.
//

import Foundation

class NewsData {

//    let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
//    "S", "T", "U", "V", "W", "X", "Y", "Z"]
//    let alphabetIndex = 0
    
    
    
    //You can sort the results in the following orders: Date published, Popularity of source, ( Relevancy to search keyword )

    let urlBase1 = "https://newsapi.org/v2/everything?q="
    let urlBase2 = "&language=en&from=2021-04-17&sortBy=publishedAt&apiKey=ea58613c9c084c38bf7e0269201e5c65"
    var urlString = ""

    struct Returned: Codable {
        var totalResults: Int
        
        var articles: [Article]
       
    }
    

    
    var articleArray: [Article] = []
    
    
    func getData(completed: @escaping ()->()) {
         
         print("🕸 We are accessing the url \(urlString)")

        // Create a URL
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            completed()
            return
        }
       // Create Session
        let session = URLSession.shared
        // Get data with .dataTask method
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
               print("😡 ERROR: \(error.localizedDescription)")
            }
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                print("\(returned)")
                self.articleArray = returned.articles
            } catch {
                print("😡 JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
        }

}
