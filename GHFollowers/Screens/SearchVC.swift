//
//  SearchViewController.swift
//  GHFollowers
//
//  Created by Tim Irrgang on 06.12.21.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextfiel = GFTextfield(placeHolder: "Username eingeben!")
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isTextFieldEmty: Bool {
        return usernameTextfiel.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        createDismissKeybordTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func createDismissKeybordTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC() {
        
        guard !isTextFieldEmty else{
            presentGFAlertOnMainThread(title: "Kein Username ", message: "Username muss eingegeben werden 🤣", buttonTitle: "OK")
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextfiel.text
        followerListVC.title = usernameTextfiel.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    
    func configureUI() {
        configureLogoImageView()
        configureTextfield()
        configureButton()
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "gh-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextfield() {
        view.addSubview(usernameTextfiel)
        usernameTextfiel.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextfiel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextfiel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            usernameTextfiel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextfiel.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
    
    func configureButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
