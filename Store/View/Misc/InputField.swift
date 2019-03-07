//
//  InputField.swift
//  Store
//
//  Created by Jonathan on 3/5/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class InputField: UIView {
    
    enum FieldType {
        case custom
        case email
        case password
        case name
    }
    
    private let input:UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Text"
        return field
    }()
    private var fieldType:FieldType?
    
    private let showButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "show-eye")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.widthAnchor.constraint(equalToConstant: 22).isActive = true
        return btn
    }()
    
    required init(placeholder:String, height:CGFloat = 44, type:FieldType = .custom) {
        super.init(frame: .zero)
        fieldType = type
        setupMainUI(height, placeholder)
    }
    
    ////////// Externally Called - Method //////////
    
    func checkValid() -> Bool {
        guard let fieldType = fieldType else { return false }
        switch fieldType {
        case .custom, .name:
            return Validate.shared.isValidName(string: input.text)
        case .email:
            return Validate.shared.isValidEmail(string: input.text)
        case .password:
            return Validate.shared.isValidPassword(string: input.text)
        }
    }
    
    func handDelegate() -> UITextField {
        return input
    }
    
    ////////// Internally Called - Method //////////
    
    fileprivate func setupMainUI(_ height: CGFloat, _ placeholder:String) {
        self.layer.cornerRadius = 6
        self.backgroundColor = UIColor("F4F6F6")
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(startEditing)))
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        let atti = NSMutableAttributedString(string: placeholder, attributes: [
            NSAttributedString.Key.foregroundColor : UIColor("8A9394"),
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)
            ])
        input.attributedPlaceholder = atti
        self.addSubview(input)
        NSLayoutConstraint.activate([
            input.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            input.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        if fieldType == .password {
            input.isSecureTextEntry = true
            showButton.addTarget(self, action: #selector(toggleShow), for: .touchUpInside)
            self.addSubview(showButton)
            NSLayoutConstraint.activate([
                showButton.heightAnchor.constraint(equalTo: self.heightAnchor),
                showButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
                showButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                input.trailingAnchor.constraint(equalTo: showButton.leadingAnchor, constant: 0)
                ])
        } else {
            input.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        }
    }
    
    ////////// Method - Actions //////////
    @objc private func toggleShow() {
        input.isSecureTextEntry = !input.isSecureTextEntry
    }

    @objc private func startEditing() {
        input.becomeFirstResponder()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
