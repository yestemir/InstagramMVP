//
//  StoryViewController.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import Foundation

import UIKit

class StoryViewController: UIViewController {
    
    lazy var storyImage: UIImageView = {
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
        animationLine()
        view.sendSubviewToBack(storyImage)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let storyViewController = HomeViewController()
            self.navigationController?.pushViewController(storyViewController, animated: true)
        }
    }
    
    private func animationLine(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 50))
        path.addLine(to: CGPoint(x: self.view.frame.width - 10, y: 50))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.path = path.cgPath
        
        view.layer.addSublayer(shapeLayer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.duration = 2
        shapeLayer.add(animation, forKey: "key")
        
        self.shapeLayer = shapeLayer
    }
    
    public func setImage(image: UIImage){
        storyImage.image = image
    }
    
    private func setup() {
        [storyImage].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        storyImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        storyImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        storyImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        storyImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
