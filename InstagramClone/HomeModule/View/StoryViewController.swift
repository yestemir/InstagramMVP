//
//  StoryViewController.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import Foundation

import UIKit

class StoryViewController: UIViewController {
    
    lazy var story: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var shapeLayer: CAShapeLayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        setup()
        view.sendSubviewToBack(story)
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let storyViewController = HomeViewController()
            self.navigationController?.pushViewController(storyViewController, animated: true)
        }
    }
    
    public func setImage(image: UIImage){
        story.image = image
    }
    
    private func setup() {
        self.view.addSubview(story)
        story.translatesAutoresizingMaskIntoConstraints = false
        
        story.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        story.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        story.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        story.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
