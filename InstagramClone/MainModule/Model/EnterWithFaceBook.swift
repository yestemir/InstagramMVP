//
//  EnterWithFaceBook.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import UIKit

class EnterWithFacebook: UIView {
    
    var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.Logos.faceBookLogo)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Войти через Facebook"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = .link
//        label.layer.borderColor = UIColor.lightGray.cgColor
//        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required convenience init?(coder: NSCoder) {
        self.init(frame: .zero)
    }
    
    func setup() {
        [image, label].forEach {
            addSubview($0)
        }
        
        image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: 32).isActive = true
//        image.heightAnchor.constraint(equalToConstant: 32).isActive = true
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6).isActive = true
        
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: image.trailingAnchor).isActive = true
        
    }

}
