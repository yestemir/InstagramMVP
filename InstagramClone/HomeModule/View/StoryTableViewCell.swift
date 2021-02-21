//
//  StoryTableViewCell.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import UIKit

class StoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var delegate: StoryTableViewCellDelegate?
    
    public var mockData: [Post] = [
        Post(profileImage: "avatar2", name: "asdasd", likes: 1, image: "avatar1", caption: "this is a caption", isLiked: false),
        Post(profileImage: "avatar3", name: "lololo", likes: 12, image: "avatar2", caption: "this is a caption", isLiked: false),
        Post(profileImage: "avatar4", name: "dina", likes: 12, image: "avatar3", caption: "this is a caption", isLiked: false),
        Post(profileImage: "avatar1", name: "yestemir", likes: 14, image: "avatar4", caption: "this is a caption", isLiked: false),
        Post(profileImage: "avatar3", name: "dino.cpp", likes: 1324, image: "avatar5", caption: "this is a caption", isLiked: false),
        Post(profileImage: "image", name: "not_dina", likes: 123, image: "avatar6", caption: "this is a caption", isLiked: false),
        
    ]
    
    lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoryCollectionViewCell
        let story = mockData[indexPath.row]
        cell.imageView.image = UIImage(named: story.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let story = mockData[indexPath.row]
        if let delegate = self.delegate{
            delegate.storyTapped(image: UIImage(named: story.image)!, ava: story.image, name: story.name)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 85)
    }
    
    func setup() {
        self.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 85).isActive = true
    
    }

}
