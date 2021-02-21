//
//  MainViewController.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - viewDidLoad
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let mainView = MainView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        mainView.delegate = self
        mainView.translatesAutoresizingMaskIntoConstraints = false
        self.presenter = MainPresenter(view: self)
        
        view.backgroundColor = .white
        
        view.addSubview(mainView)
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}


extension MainViewController: MainViewProtocol, MainViewDelegate {

    func presentAlert(alert: UIAlertController, animated: Bool) {
        present(alert, animated: animated, completion: nil)
    }
    
    func presentTabBar(tabBarVC: UITabBarController, animated: Bool) {
        present(tabBarVC, animated:false, completion: nil)
    }
    
    func showPasswordTapped(_ rightImageView: UIImageView, _ passwordField: UITextField){
        presenter.getPasswordTapped(rightImageView, passwordField)
    }
    
    func loginButtonTapped(_ loginTextField: UITextField, _ passwordField: UITextField){
        presenter.getLoginButtonTapped(loginTextField, passwordField)
        
    }
    
    
}
