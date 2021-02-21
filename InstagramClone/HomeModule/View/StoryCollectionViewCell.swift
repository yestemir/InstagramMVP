//
//  StoryCollectionViewCell.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import UIKit

protocol StoryTableViewCellDelegate{
    func storyTapped(image: UIImage, ava: String, name: String)
}

class StoryCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        imageView.image = UIImage(named: "image")
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.layer.borderWidth = 2
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()

    override init(frame: CGRect = .zero) {
        super .init(frame: frame)
        setup()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [imageView].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: self.imageView.frame.size.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: self.imageView.frame.size.height).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
