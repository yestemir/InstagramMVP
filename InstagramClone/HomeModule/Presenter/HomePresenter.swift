//
//  HomePresenter.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import Foundation
import UIKit


class NewPost {
    static let singleton = NewPost()
    var post: Post?
}

protocol HomeViewProtocol {
    func updateData(posts: [Post])
}

protocol HomeViewPresenterProtocol {
    init(view: HomeViewProtocol, posts: [Post])
    func getLike(index: Int)
    func addPost()
}

class HomeViewPresenter: HomeViewPresenterProtocol{

    
    let view: HomeViewProtocol
    var posts: [Post]
    
    required init(view: HomeViewProtocol, posts: [Post]) {
        self.view = view
        self.posts = posts
    }
    
    func addPost(){
        if let newPost = NewPost.singleton.post {
            posts.append(newPost)
            self.view.updateData(posts: posts)
        }
    }
    
    func getLike(index: Int) {
        if (posts[index].isLiked) {
            posts[index].isLiked = false
            posts[index].likes -= 1
        }else{
            posts[index].isLiked = true
            posts[index].likes += 1
        }
        self.view.updateData(posts: posts)
    }
}
