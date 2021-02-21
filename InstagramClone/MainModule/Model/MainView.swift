//
//  MainView.swift
//  InstagramClone
//
//  Created by Dina Yestemir on 22.02.2021.
//

import UIKit

class MainView: UIView {
    
    var delegate: MainViewDelegate?
    
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.backgroundColor = .white
        
        loginTextField.delegate = self
        passwordField.delegate = self
        
        setup()
    }
    
    required convenience init?(coder: NSCoder) {
        self.init(frame: .zero)
        setup()
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.frame = scrollView.bounds
        
        return scrollView
    }()
    
    private lazy var cancelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.Logos.cancel)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    private lazy var instagramImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.Logos.instagramFont)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    
    private lazy var loginTextField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 1
        field.layer.borderColor = Constants.Colors.textFieldBorder
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.backgroundColor = Constants.Colors.textFieldBackgroundColor
        field.textColor = .black
        //margin to text
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
//        field.backgroundColor = .white
        field.placeholder = "Enter your email"
        field.text = "dina"
        
        return field
    }()
    
    private lazy var passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 1
        field.layer.borderColor = Constants.Colors.textFieldBorder
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.backgroundColor = Constants.Colors.textFieldBackgroundColor
        //margin to text
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.textColor = .black
//        field.backgroundColor = .white
        field.placeholder = "Enter your password"
        field.isSecureTextEntry = true
        field.text = "Asdasdasd"
        
        rightImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        rightImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        field.rightView =  rightImageView
        field.rightViewMode = .always
        
        
        return field
    }()
    
    private lazy var rightImageView: UIImageView = {
        let image = UIImage(named: Constants.Logos.dontShow)!
        let rightImageView = UIImageView()
        rightImageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//        rightImageView.backgroundColor = .link
        rightImageView.image = image
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPasswordTapped)))
        rightImageView.isUserInteractionEnabled = true
        
        return rightImageView
    }()
    
    private lazy var forgotPassword: UILabel = {
        let label = UILabel()
        label.text = "Forgot password?"
        label.textAlignment = .right
        label.textColor = Constants.Colors.forgetPasswordLabelColor
        label.font = UIFont.boldSystemFont(ofSize: 13.0)
//        label.layer.borderColor = UIColor.lightGray.cgColor
//        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = Constants.Colors.loginButtonColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self,action: #selector(loginButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var lineImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = Constants.Colors.lineImageViewColor
        view.image = UIImage(named: Constants.Logos.line)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "  или  "
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    private lazy var registerTextLabel: UILabel = {
        let label = UILabel()
        label.text = "У вас нет аккаунта? "
        label.backgroundColor = .white
        label.textAlignment = .center
//        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(registerTapped)))
        label.isUserInteractionEnabled = true
        label.frame.size.width = 320
        
        return label
    }()
    
    private lazy var registerLabel: UILabel = {
        let registerLabel = UILabel()
        registerLabel.text = "Зарегистрируйтесь"
        registerLabel.textColor = Constants.Colors.forgetPasswordLabelColor
        registerLabel.backgroundColor = .white
        registerLabel.textAlignment = .center
//        label.layer.borderWidth = 1
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        registerLabel.isUserInteractionEnabled = true
        
        return registerLabel
    }()
    
    private lazy var enterWithFacebook: EnterWithFacebook = {
        let view = EnterWithFacebook()
//        view.layer.borderWidth = 1
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    
    //MARK: - Setup
    
    
    
    func setup() {
        scrollView.frame = self.bounds
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.frame.width, height: self.frame.height)
        scrollView.frame = self.frame
        scrollView.contentSize = CGSize(width: self.frame.width, height: self.frame.height * 10)
        let topViewContainer = UIView()
//        topViewContainer.clipsToBounds = true
        let middleViewContainer = UIView()
        let bottomViewContainer = UIView()
//        scrollView.addSubview(middleViewContainer)
        topViewContainer.translatesAutoresizingMaskIntoConstraints = false
        middleViewContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        [topViewContainer, middleViewContainer, bottomViewContainer].forEach {
            scrollView.addSubview($0)
        }
        
        //MARK: - topViewContainer
        
        topViewContainer.addSubview(cancelImageView)
        topViewContainer.addSubview(instagramImageView)
//        topViewContainer.backgroundColor = .link
        
        
        topViewContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        topViewContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topViewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topViewContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25).isActive = true
        
        
        cancelImageView.topAnchor.constraint(equalTo: topViewContainer.topAnchor, constant: 16).isActive = true
//        cancelImageView.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 16).isActive = true
        cancelImageView.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -16).isActive = true
        cancelImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cancelImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    
        
        instagramImageView.bottomAnchor.constraint(equalTo: topViewContainer.bottomAnchor).isActive = true
        instagramImageView.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor).isActive = true
        instagramImageView.widthAnchor.constraint(equalTo: topViewContainer.widthAnchor, multiplier: 0.5).isActive = true
        instagramImageView.heightAnchor.constraint(equalTo: topViewContainer.heightAnchor, multiplier: 0.3).isActive = true
//        logoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        //MARK: - middleViewContainer
        
        middleViewContainer.addSubview(loginTextField)
        middleViewContainer.addSubview(passwordField)
        middleViewContainer.addSubview(forgotPassword)
        middleViewContainer.addSubview(loginButton)
        middleViewContainer.addSubview(lineImageView)
        middleViewContainer.addSubview(orLabel)
        middleViewContainer.addSubview(enterWithFacebook)
//        middleViewContainer.backgroundColor = .red
        
        middleViewContainer.topAnchor.constraint(equalTo: topViewContainer.bottomAnchor).isActive = true
        middleViewContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        middleViewContainer.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        middleViewContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        
        
        loginTextField.centerXAnchor.constraint(equalTo: middleViewContainer.centerXAnchor).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: middleViewContainer.leadingAnchor, constant: 20).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: middleViewContainer.trailingAnchor, constant: -20).isActive = true
        loginTextField.topAnchor.constraint(equalTo: middleViewContainer.topAnchor, constant: 40).isActive = true
        loginTextField.heightAnchor.constraint(equalTo: middleViewContainer.heightAnchor, multiplier: 0.1).isActive = true
        
        
        
        passwordField.centerXAnchor.constraint(equalTo: middleViewContainer.centerXAnchor).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: middleViewContainer.leadingAnchor, constant: 20).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: middleViewContainer.trailingAnchor, constant: -20).isActive = true
        passwordField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 15).isActive = true
        passwordField.heightAnchor.constraint(equalTo: middleViewContainer.heightAnchor, multiplier: 0.1).isActive = true
        
        
        forgotPassword.trailingAnchor.constraint(equalTo: middleViewContainer.trailingAnchor, constant: -20).isActive = true
        forgotPassword.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 25).isActive = true
        
        
        
        
        loginButton.centerXAnchor.constraint(equalTo: middleViewContainer.centerXAnchor).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: middleViewContainer.leadingAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: middleViewContainer.trailingAnchor, constant: -20).isActive = true
        loginButton.topAnchor.constraint(equalTo: forgotPassword.bottomAnchor, constant: 30).isActive = true
        loginButton.heightAnchor.constraint(equalTo: middleViewContainer.heightAnchor, multiplier: 0.1).isActive = true
        
        
        lineImageView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 45).isActive = true
        lineImageView.leadingAnchor.constraint(equalTo: middleViewContainer.leadingAnchor, constant: 20).isActive = true
        lineImageView.trailingAnchor.constraint(equalTo: middleViewContainer.trailingAnchor, constant: -20).isActive = true
        lineImageView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        orLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 40).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: middleViewContainer.centerXAnchor).isActive = true
        
        
        enterWithFacebook.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 1).isActive = true
        enterWithFacebook.centerXAnchor.constraint(equalTo: middleViewContainer.centerXAnchor).isActive = true
        enterWithFacebook.heightAnchor.constraint(equalTo: middleViewContainer.heightAnchor, multiplier: 0.15).isActive = true
        
        
        //MARK: - bottomViewContainer
        
        bottomViewContainer.addSubview(registerLabel)
        bottomViewContainer.addSubview(registerTextLabel)
        
        bottomViewContainer.topAnchor.constraint(equalTo: middleViewContainer.bottomAnchor).isActive = true
        bottomViewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomViewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomViewContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        
        bottomViewContainer.layer.borderWidth = 1
        
        registerTextLabel.topAnchor.constraint(equalTo: bottomViewContainer.topAnchor, constant: 5).isActive = true
        registerTextLabel.leadingAnchor.constraint(equalTo: bottomViewContainer.leadingAnchor, constant: ((self.frame.size.width - registerTextLabel.frame.size.width - registerLabel.frame.size.width) / 2)).isActive = true
//        print(self.registerTextLabel.frame.width)
//        print((bottomViewContainer.frame.width - registerTextLabel.frame.width - registerLabel.frame.width) )
//        registerTextLabel.trailingAnchor.constraint(equalTo: bottomViewContainer.trailingAnchor).isActive = true
        registerTextLabel.heightAnchor.constraint(equalTo: bottomViewContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        registerLabel.topAnchor.constraint(equalTo: bottomViewContainer.topAnchor, constant: 5).isActive = true
        registerLabel.leadingAnchor.constraint(equalTo: registerTextLabel.trailingAnchor).isActive = true
        registerLabel.heightAnchor.constraint(equalTo: bottomViewContainer.heightAnchor, multiplier: 0.5 ).isActive = true
        
    }
    
    //MARK: - loginButtonTapped
    
    @objc func loginButtonTapped() {
        
        delegate?.loginButtonTapped(loginTextField, passwordField)
        
    }
    
    //MARK: - showPasswordTapped
    
    @objc func showPasswordTapped(){
        delegate?.showPasswordTapped(rightImageView, passwordField)
    }


}

//MARK: - Extension with delegate

extension MainView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == loginTextField {
            passwordField.becomeFirstResponder()
        }else if textField == passwordField {
            loginButtonTapped()
        }
        
        return true
    }
}
