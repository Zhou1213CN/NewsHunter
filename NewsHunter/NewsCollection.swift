//
//  NewsCollection.swift
//  NewsHunter
//
//  Created by Zheng Zhou on 2021/5/18.
//

import Foundation
import Firebase

class NewsCollection {
    var headline: String
    var date: String
    var text: String
    var link: String
    var image: UIImage
    var postingUserID: String
    var documentID: String
    
    var dictionary: [String: Any] {
        return ["headline":headline, "date": date, "text": text, "link": link, "image": image, "postingUserID": postingUserID]
    }
    
    init(headline: String, date: String, text: String, link: String, image: UIImage, postingUerID:String, documentID: String){
        self.headline = headline
        self.date = date
        self.text = text
        self.link = link
        self.image = UIImage()
        self.postingUserID = postingUerID
        self.documentID = documentID
    }
    convenience init(){
        self.init(headline: "", date: "", text: "", link: "", image: UIImage(), postingUerID:"", documentID: "")
    }
    
    func saveData(completed: @escaping (Bool) -> () ) {
            let db = Firestore.firestore()
            
            // Grab the user ID
            guard let postingUserID = Auth.auth().currentUser?.uid else {
                print("**** ERROR: Could not save data because we don't have a valid postingUserID")
                return completed(false)
            }
            self.postingUserID = postingUserID
            let dataToSave: [String: Any] = self.dictionary
            if self.documentID != "" { // save data to an existing document
                // get the path for the exiseting document
                var ref: DocumentReference? = nil
                ref = db.collection("news").addDocument(data: dataToSave) { (error) in
                    guard error == nil else {
                        print("*** ERROR: adding document \(error!.localizedDescription)")
                        return completed(false)
                    }
                    self.documentID = ref!.documentID
                    print("Added document: \(self.documentID)")
                    completed(true)
                    
                }
            } else {
                let ref = db.collection("news").document(self.documentID)
                ref.setData(dataToSave) { (error) in
                    guard error == nil else {
                        print("*** ERROR: updating document \(error!.localizedDescription)")
                        return completed(false)
                    }
                    print("Updated document: \(self.documentID)")
                    completed(true)
                }
            }
    }
}
