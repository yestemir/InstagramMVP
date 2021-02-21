//
//  PostTableViewCell.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    lazy var postView: PostView = {
        let postView = PostView()
        postView.isUserInteractionEnabled = true
        return postView
    }()
    
    @objc func tap() {
        print("tap")
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentView.addSubview(postView)
        postView.translatesAutoresizingMaskIntoConstraints = false
        
        postView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        postView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        postView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        postView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
