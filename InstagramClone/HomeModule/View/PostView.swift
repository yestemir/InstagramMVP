//
//  PostView.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import UIKit

class PostView: UIView {
    
    lazy var numberOfLikes = Int()
    
    lazy var profileImage: UIImageView = {
        let profileImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
//        profileImage.image = UIImage(named: "image")
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.layer.borderWidth = 0
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.contentMode = .scaleAspectFill
        
        return profileImage
    }()
    
    lazy var username: UILabel = {
        let username = UILabel()
        username.textColor = .black
        username.text = "asdasd"
        return username
    }()
    
    lazy var moreInfo: UIButton = {
        let moreInfo = UIButton()
        moreInfo.setBackgroundImage(UIImage(named: Constants.moreImage), for: .normal)
        return moreInfo
    }()
    
    lazy var postImage: UIImageView = {
        let postImage = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width - 20))
        
        return postImage
    }()
    
    lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.setBackgroundImage(UIImage(named: Constants.heartImage), for: .normal)
        
        return likeButton
    }()
    
    lazy var commentButton: UIButton = {
        let commetButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        commetButton.layer.borderWidth = 1
        directButton.setBackgroundImage(UIImage(named: Constants.commentImage), for: .normal)
        
        return commetButton
    }()
    
    lazy var directButton: UIButton = {
        let directButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        directButton.setBackgroundImage(UIImage(named: Constants.directImage), for: .normal)
        
        return directButton
    }()
    
    lazy var likedBy: UIImageView = {
        let likedBy = UIImageView()
        
        return likedBy
    }()
    
    lazy var likedByLabel: UILabel = {
        let likedByLabel = UILabel()
        likedByLabel.text = "Likes: \(numberOfLikes)"
        likedByLabel.font = .boldSystemFont(ofSize: 16)
        
        return likedByLabel
    }()
    
    lazy var user: UILabel = {
        let user = UILabel()
        user.font = .boldSystemFont(ofSize: 16)
        
        return user
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Caption for the photo"
        titleLabel.numberOfLines = 0
        
        return titleLabel
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        [profileImage, username, moreInfo, postImage, likeButton, directButton, likedByLabel, titleLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: self.profileImage.frame.size.width).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: self.profileImage.frame.size.height).isActive = true
        
        username.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        username.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10).isActive = true
        username.widthAnchor.constraint(equalToConstant: 100).isActive = true
        username.heightAnchor.constraint(equalToConstant: self.profileImage.frame.size.height).isActive = true
        
        
        moreInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        moreInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        moreInfo.widthAnchor.constraint(equalToConstant: 20).isActive = true
        moreInfo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        postImage.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        postImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        postImage.widthAnchor.constraint(equalToConstant: self.postImage.frame.size.width).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: self.postImage.frame.size.height).isActive = true
        
        likeButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        directButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        directButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10).isActive = true
        directButton.widthAnchor.constraint(equalToConstant: self.directButton.frame.size.width).isActive = true
        directButton.heightAnchor.constraint(equalToConstant: self.directButton.frame.size.width).isActive = true
        
        likedByLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 10).isActive = true
        likedByLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        likedByLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        likedByLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: likedByLabel.bottomAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }
    

}
