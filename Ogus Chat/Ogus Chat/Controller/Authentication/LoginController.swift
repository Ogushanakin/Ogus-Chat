//
//  LoginController.swift
//  Ogus Chat
//
//  Created by AKIN on 18.10.2022.
//

import UIKit

final class LoginController: UIViewController {
    
    // MARK: - Properties
    
    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = #colorLiteral(red: 0.1843137255, green: 0.2352941176, blue: 0.4941176471, alpha: 1)
        return iv
    }()
    
    private let iconLabel: UILabel = {
        let label = UILabel()
        label.text = "Ogus Chat"
        label.font = UIFont(name: "Copperplate", size: 25.0)
        label.textColor = #colorLiteral(red: 0.9843137255, green: 0.9176470588, blue: 0.9215686275, alpha: 1)
        return label
    }()
    
    private lazy var emailContainerView: UIView = {
        return InputContainerView(image: UIImage(systemName: "envelope"),
                                  textField: emailTextField)
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(image: UIImage(systemName: "lock"),
                                  textField: passwordTextField)
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = #colorLiteral(red: 0.9843137255, green: 0.9176470588, blue: 0.9215686275, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.2352941176, blue: 0.4941176471, alpha: 1)
        button.setHeight(height: 50)
        return button
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ",
                                                        attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                     .foregroundColor: #colorLiteral(red: 0.9843137255, green: 0.9176470588, blue: 0.9215686275, alpha: 1)])
        attributedTitle.append(NSAttributedString(string: "Sign Up",
                                                  attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                                                               .foregroundColor: #colorLiteral(red: 0.9843137255, green: 0.9176470588, blue: 0.9215686275, alpha: 1)]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleShowSignUp() {
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    // MARK: - Helpers
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        setGradientBackground()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)
        
        view.addSubview(iconLabel)
        iconLabel.centerX(inView: view)
        iconLabel.anchor(top: iconImage.bottomAnchor, paddingTop: -40)
        iconLabel.setDimensions(height: 120, width: 140)
         
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: iconLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: -25, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 251.0/255.0, green: 234.0/255.0, blue: 235/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 47.0/255.0, green: 60.0/255.0, blue: 126.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }

}


