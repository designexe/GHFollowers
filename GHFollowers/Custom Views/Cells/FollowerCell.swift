//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Tim Irrgang on 22.12.21.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImage = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAligment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower:Follower) {
        usernameLabel.text = follower.login
        avatarImage.downloadImage(from: follower.avatarUrl)
        
    }
    
    private func configureUI() {
        configureAvatarImage()
        configureUsernameLabe()
    }
    
    private func configureAvatarImage() {
        addSubview(avatarImage)
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor)
        ])
    }
    private func configureUsernameLabe() {
        addSubview(usernameLabel)
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImage.leadingAnchor, constant: padding ),
            usernameLabel.trailingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
