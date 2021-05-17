//
//  NewsReactionViewController.swift
//  NewsHunter
//
//  Created by Zheng Zhou on 2021/5/18.
//

import UIKit

class NewsReactionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
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

}
