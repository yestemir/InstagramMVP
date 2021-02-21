//
//  MainPresenter.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import Foundation
import UIKit

protocol MainViewProtocol {
    func showPasswordTapped(_ rightImageView: UIImageView, _ passwordField: UITextField)
    func loginButtonTapped(_ loginTextField: UITextField, _ passwordField: UITextField)
    func presentTabBar(tabBarVC: UITabBarController, animated: Bool)
    func presentAlert(alert: UIAlertController, animated: Bool)
}

protocol MainViewPresenterProtocol {
    init(view: MainViewProtocol)
    func getPasswordTapped(_ rightImageView: UIImageView, _ passwordField: UITextField)
    func getLoginButtonTapped(_ loginTextField: UITextField, _ passwordField: UITextField)
}

class MainPresenter: MainViewPresenterProtocol {
    
    var view: MainViewProtocol
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    func getPasswordTapped(_ rightImageView: UIImageView, _ passwordField: UITextField) {
        if(rightImageView.image == UIImage(named: Constants.Logos.dontShow)) {
            rightImageView.image = UIImage(named: Constants.Logos.show)
            print("Show Password tapped")
            passwordField.isSecureTextEntry = false
        }else{
            rightImageView.image = UIImage(named: Constants.Logos.dontShow)
            print("Don't show Password tapped")
            passwordField.isSecureTextEntry = true
        }
    }
    
    func getLoginButtonTapped(_ loginTextField: UITextField, _ passwordField: UITextField) {
        loginTextField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let login = loginTextField.text, let password = passwordField.text, !login.isEmpty, !password.isEmpty, password.count >= 8, password.prefix(1).uppercased() == password.prefix(1) else {
            getAlerUserLoginError()
            return
        }
        let tabBarVC = UITabBarController()
        
        let v1 = UINavigationController(rootViewController: HomeViewController())
        let v3 = UINavigationController(rootViewController: AddViewController())
        
        v1.title = "Home"
        v3.title = "Add"
        
        tabBarVC.setViewControllers([v1, v3], animated: false)
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let images = [Constants.TabBarImages.home, Constants.TabBarImages.add]
        
        for i in 0..<items.count {
            items[i].image = UIImage(named: images[i])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        
        view.presentTabBar(tabBarVC: tabBarVC, animated: false)
        
    }
    
    func getAlerUserLoginError() {
        let alert = UIAlertController(title: "Oops...", message: "Please enter all information to login, Password should contain more than 8 characters and the first one has to be uppercased", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        view.presentAlert(alert: alert, animated: true)
    }
    
    
}
