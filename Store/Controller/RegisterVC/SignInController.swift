//
//  SignInController.swift
//  Store
//
//  Created by Jonathan on 3/5/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SignInController: UIViewController,UITextFieldDelegate {
    
    // Title View
    private let titleView:UILabel = {
        let label = UILabel()
        label.text = "Welcome\nto your Store"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textColor = .gray99
        return label
    }()

    // Logo Image
    private let imageLogo:UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo-icon-40px"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return image
    }()
    
    // Sub Title View
    private let subTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Biggest collection of 300+ layouts\nfor iOS prototyping."
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray99
        return label
    }()
    
    // Register Stack
    private let registerStack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    // Email Field
    private let emailField = InputField(placeholder: "Email")
    
    // Password Field
    private let passwordField = InputField(placeholder: "Password", height: 44, type: InputField.FieldType.password)
    
    // Login Button
    private let loginButton = CustomUIBUtton(title: "Login")
    
    // Forgot Password Button
    private let forgotButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle(" Forgot password", for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        btn.setTitleColor(.baseColor, for: .normal)
        return btn
    }()
    
    // Sign Up Button
    private let signUpButton:CustomUIBUtton = {
        let btn = CustomUIBUtton(title: "Sign Up", img: UIImage(named: "right-arrow"))
        btn.title.textColor = .gray99
        btn.backgroundColor = .gray19
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // Configure UI
    private func configureUI() {
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(stopEditing)))
        
        // Title View
        view.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13)
            ])
        
        // Logo Image
        view.addSubview(imageLogo)
        NSLayoutConstraint.activate([
            imageLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            imageLogo.topAnchor.constraint(equalTo: titleView.topAnchor)
            ])
        
        // Sub Title View
        view.addSubview(subTitle)
        NSLayoutConstraint.activate([
            subTitle.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            subTitle.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 15)
            ])
        
        // Register Stack
        view.addSubview(registerStack)
        NSLayoutConstraint.activate([
            registerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            registerStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            registerStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
        emailField.handDelegate().delegate = self
        passwordField.handDelegate().delegate = self
        registerStack.addArrangedSubviews(views: [emailField, passwordField, loginButton, forgotButton])
        registerStack.setCustomSpacing(20, after: passwordField)
        
        // Sign Up Button
        signUpButton.addTarget(self, action: #selector(launchSignUp), for: .touchUpInside)
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: registerStack.widthAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            ])
    }
    
    
    
    ////////// Method - Actions //////////
    @objc private func stopEditing() {
        view.endEditing(true)
    }
    
    @objc private func launchSignUp() {
        self.navigationController?.pushViewController(SignUpController(), animated: true)
    }
    
    ////////// Textfield - Methods //////////
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animationControl(0.3, tranform: CGAffineTransform(translationX: 0, y: -20), targets: [registerStack/*,titleView,subTitle*/])
        UIView.animationControl(0.3, tranform: CGAffineTransform(translationX: 0, y: -10), targets: [titleView,subTitle])
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animationControl(0.3, tranform: .identity, targets: [registerStack,titleView,subTitle])
    }
    
    
    
}

