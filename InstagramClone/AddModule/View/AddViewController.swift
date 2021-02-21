//
//  AddViewController.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import Foundation
import UIKit

protocol AddPostDelegate {
    func addPost(post: Post)
}

class AddViewController: UIViewController, AddViewProtocol {
   
    
    let pickerController = UIImagePickerController()
    var image: UIImage?
    var presenter: AddPresenterProtocol!
//    var delegate: AddPostDelegate!
    
    lazy var postImage: UIButton = {
        let button = UIButton()
        button.setTitle("Choose a photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        button.addTarget(self, action: #selector(postImagePressed), for: .touchUpInside)
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        setup()
        view.backgroundColor = .white
        presenter = AddPresenter.init(view: self)
    }
    
    @objc func postImagePressed(_ sender: UIButton){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actCancel)
        let actLibrary = UIAlertAction(title: "Import from Library", style: .default, handler: { _ in self.choosePhotoFromLibrary() })
        alert.addAction(actLibrary)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func saveButtonPressed(_ sender: UIButton){
        presenter.addNewPost(image: self.image)
        let mainViewController = HomeViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    func addNewPost(post: Post) {
//        delegate.addPost(post: post)
    }
    
    
    private func setup(){
        [postImage, saveButton].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        postImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        postImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        postImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        saveButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 60).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
}

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func choosePhotoFromLibrary() {
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        if let theImage = image {
            self.image = theImage
        }
        dismiss(animated: true, completion: nil)
    }
}

