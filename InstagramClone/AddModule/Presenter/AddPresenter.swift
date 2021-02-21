//
//  AddPresenter.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import Foundation
import UIKit

protocol  AddViewProtocol {
    func addNewPost(post: Post)
}

protocol AddPresenterProtocol {
    init(view: AddViewProtocol)
    func addNewPost(image: UIImage?)
}

class AddPresenter: AddPresenterProtocol {
    
    let view: AddViewProtocol
    
    required init(view: AddViewProtocol) {
        self.view = view
    }
    
    func addNewPost(image: UIImage?) {
        guard image != nil else { return }
        // adds at the end (
        let post = Post(profileImage: "avatar1", name: "newPost", likes: 1, image: "image", caption: "new post added", isLiked: false)
        NewPost.singleton.post = post
    }
   
}

