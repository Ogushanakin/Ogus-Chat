//
//  ProfileHeader.swift
//  Ogus Chat
//
//  Created by AKIN on 22.10.2022.
//

import UIKit

protocol ProfileHeaderDelegate: AnyObject {
    func dismissController()
}

final class ProfileHeader: UIView {
    
    // MARK: - Properties
    
    var user: User? {
        didSet { populateUserData() }
    }
    
    weak var delegate: ProfileHeaderDelegate?
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.tintColor = #colorLiteral(red: 0.170517385, green: 0.2371833622, blue: 0.5116912127, alpha: 1)
        button.imageView?.setDimensions(height: 22, width: 22)
        return button
    }()
    
    private let profileImageView: UIImageView = {
         let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 4.0
        return iv
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.170517385, green: 0.2371833622, blue: 0.5116912127, alpha: 1)
        label.textAlignment = .center
        label.text = "Joey Tribbiani"
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.170517385, green: 0.2371833622, blue: 0.5116912127, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "@joey"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleDismissal() {
        delegate?.dismissController()
    }
    
    
    // MARK: - Helpers
    
    func populateUserData() {
        guard let user = user else { return }
        
        fullnameLabel.text = user.fullname
        usernameLabel.text = "@" + user.username
        
        guard let url = URL(string: user.profileImageUrl) else { return }
        profileImageView.sd_setImage(with: url)
    }
    
    func configureUI() {
        backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9176470588, blue: 0.9215686275, alpha: 1)
        
        profileImageView.setDimensions(height: 200, width: 200)
        profileImageView.layer.cornerRadius = 200 / 2
        
        addSubview(profileImageView)
        profileImageView.centerX(inView: self)
        profileImageView.anchor(top: topAnchor, paddingTop: 96)
        
        let stack = UIStackView(arrangedSubviews: [fullnameLabel, usernameLabel])
        stack.axis = .vertical
        stack.spacing = 4
        
        addSubview(stack)
        stack.centerX(inView: self)
        stack.anchor(top: profileImageView.bottomAnchor, paddingTop: 16)
        
        addSubview(dismissButton)
        dismissButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 44, paddingLeft: 12)
        dismissButton.setDimensions(height: 48, width: 48)
    }

}
