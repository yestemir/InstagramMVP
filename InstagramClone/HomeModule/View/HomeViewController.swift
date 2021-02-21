//
//  ViewController.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 21.02.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    public var mockData: [Post] = [
        Post(profileImage: "avatar2", name: "asdasd", likes: 1, image: "avatar1", caption: "this is a caption", isLiked: false),
        Post(profileImage: "avatar3", name: "not_dina", likes: 12, image: "avatar2", caption: "this is a caption", isLiked: false),
        Post(profileImage: "avatar4", name: "dina", likes: 12, image: "avatar3", caption: "this is a caption", isLiked: false),
        Post(profileImage: "avatar1", name: "yestemir", likes: 14, image: "avatar4", caption: "this is a caption", isLiked: false),
        Post(profileImage: "avatar3", name: "dino.cpp", likes: 1324, image: "avatar5", caption: "this is a caption", isLiked: false),
        Post(profileImage: "image", name: "ololol", likes: 123, image: "avatar6", caption: "this is a caption", isLiked: false),
        
    ]
    
    var table = UITableView()
    
    var presenter: HomeViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "postCell")
        table.register(StoryTableViewCell.self, forCellReuseIdentifier: "storyCell")
        view.addSubview(table)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
        presenter = HomeViewPresenter.init(view: self, posts: mockData)
//        let addPostView = AddViewController()
//        addPostView.delegate = self
        self.navigationItem.setHidesBackButton(true, animated: true)
        presenter.addPost()
        
        presenter = HomeViewPresenter.init(view: self, posts: mockData)
        
        table.allowsSelection = false
        
        setupTable()
    }
    
    func setupTable() {
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "storyCell") as! StoryTableViewCell
            cell.contentView.isUserInteractionEnabled = false
            cell.delegate = self
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostTableViewCell
            cell.postView.likeButton.tag = indexPath.row
            cell.postView.username.text = mockData[indexPath.row].name
            cell.postView.titleLabel.text = mockData[indexPath.row].caption
            if (mockData[indexPath.row].isLiked) {
                cell.postView.likeButton.setBackgroundImage(UIImage(named: Constants.filledHeatrImage), for: .normal)
            }else{
                cell.postView.likeButton.setBackgroundImage(UIImage(named: Constants.heartImage), for: .normal)
            }
            cell.postView.postImage.image = UIImage(named: mockData[indexPath.row].image)
            cell.postView.likedByLabel.text = "Likes: \(mockData[indexPath.row].likes)"
            cell.postView.numberOfLikes = mockData[indexPath.row].likes
            cell.postView.profileImage.image = UIImage(named: mockData[indexPath.row].profileImage)
            
            cell.postView.likeButton.addTarget(self, action: #selector(like(sender: )), for: .touchUpInside)
            return cell
        }
        
    }
    
    @objc func like(sender: UIButton) {
        presenter.getLike(index: sender.tag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 85
        }else{
            return view.frame.size.width + 2 * ( UIScreen.main.bounds.width / 7 ) + 70
        }
        
    }
    
    
}


extension HomeViewController: HomeViewProtocol {
    func updateData(posts: [Post]) {
        self.mockData = posts
        self.table.reloadData()
    }
}

extension HomeViewController: StoryTableViewCellDelegate{
    func storyTapped(image: UIImage, ava: String, name: String) {
        let storyViewController = StoryViewController()
        storyViewController.setImage(image: image)
        
        self.navigationController?.pushViewController(storyViewController, animated: true)
    }
}


extension HomeViewController: AddPostDelegate {
    func addPost(post: Post) {
        mockData.append(post)
    }
}
