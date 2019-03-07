//
//  SignUpController.swift
//  Store
//
//  Created by Jonathan on 3/5/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SignUpController: UIViewController, UITextFieldDelegate {
    
    // Sign Up Button
    private let faceBookSignIn:CustomUIBUtton = {
        let btn = CustomUIBUtton(title: "Log In with Facebook", img: UIImage(named: "facebook-icon-18px"))
        btn.title.textColor = .gray99
        btn.backgroundColor = .gray19
        return btn
    }()
    
    
    private let googleSignIn:CustomUIBUtton = {
        let btn = CustomUIBUtton(title: "Log In with Google", img: UIImage(named: "google-icon-18px"))
        btn.title.textColor = .gray99
        btn.backgroundColor = .gray19
        return btn
    }()
    
    // Stack View
    private let stackView:UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 10
        return sv
    }()
    
    // Seperator
    private let seperatorLabel:UILabel = {
        let label = UILabel()
        label.text = "or sign up with Email"
        label.textColor = .gray79
        label.textAlignment = .center
        return label
    }()
    
    // First Name Field
    private let firstNameField = InputField(placeholder: "First Name")
    
    // Second Name Field
    private let lastNameField = InputField(placeholder: "Last Name")
    
    // Email Field
    private let emailField = InputField(placeholder: "Email")
    
    // Password Field
    private let passwordField = InputField(placeholder: "Password", height: 44, type: InputField.FieldType.password)
    
    // Password Confirm Field
    private let passwordConfirmField = InputField(placeholder: "Confirm Password", height: 44, type: InputField.FieldType.password)
    
    // Login Button
    private let loginButton = CustomUIBUtton(title: "Continue")
    
    // Privacy Button
    private let privacyButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.numberOfLines = 0
        btn.titleLabel?.textAlignment = .center
        let atti = NSMutableAttributedString(string: "By signing up, you agree to our\n", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray79])
        atti.append(NSAttributedString(string: "Terms", attributes: [NSAttributedString.Key.foregroundColor : UIColor.baseColor]))
        atti.append(NSAttributedString(string: " and ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray79]))
        atti.append(NSAttributedString(string: "Privacy", attributes: [NSAttributedString.Key.foregroundColor : UIColor.baseColor]))
        btn.setAttributedTitle(atti, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewEndEditing)))
        configureNav()
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23)
            ])
        stackView.addArrangedSubviews(views: [googleSignIn,faceBookSignIn,seperatorLabel,firstNameField,lastNameField,emailField,passwordField,passwordConfirmField,loginButton,privacyButton])
        stackView.setCustomSpacing(20, after: faceBookSignIn)
        stackView.setCustomSpacing(20, after: seperatorLabel)
        stackView.setCustomSpacing(20, after: passwordConfirmField)
        handleDelegate(views: [firstNameField.handDelegate(),lastNameField.handDelegate(),emailField.handDelegate(),passwordField.handDelegate(),passwordConfirmField.handDelegate()])
    }
    
    private func configureNav() {
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "logo-icon-20px"))
    }
    
    private func handleDelegate(views:[UITextField]) {
        for item in views {
            item.delegate = self
        }
    }
    
    @objc private func viewEndEditing() {
        view.endEditing(true)
    }
    
    
    ////////// Textfield - Methods //////////
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animationControl(0.3, tranform: CGAffineTransform(translationX: 0, y: -169), targets: [stackView])
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animationControl(0.3, tranform: .identity, targets: [stackView])     
    }
    
}
