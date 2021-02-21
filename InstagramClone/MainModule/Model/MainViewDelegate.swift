//
//  MainViewDelegate.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import Foundation
import UIKit

protocol MainViewDelegate {
    func loginButtonTapped(_ loginTextField: UITextField, _ passwordField: UITextField)
    func showPasswordTapped(_ rightImageView: UIImageView,  _ passwordField: UITextField)

}

