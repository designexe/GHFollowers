//
//  GFAlertViewController.swift
//  GHFollowers
//
//  Created by Tim Irrgang on 13.12.21.
//

import UIKit

class GFAlertViewController: UIViewController {
    
    let containerView = UIView()
    let titleLable = GFTitleLabel(textAligment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "OK")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configerTitleLable()
        configureButton()
        configerMessageLabel()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configerTitleLable()  {
        containerView.addSubview(titleLable)
        titleLable.text = alertTitle ?? "Alert"
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLable.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "OK", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configerMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Error"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
            
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}
