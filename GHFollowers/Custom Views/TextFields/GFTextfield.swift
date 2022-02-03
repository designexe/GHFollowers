//
//  GFTextfield.swift
//  GHFollowers
//
//  Created by Tim Irrgang on 08.12.21.
//

import UIKit

class GFTextfield: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init (placeHolder: String) {
        super.init(frame: .zero)
        configure()
        self.placeholder = placeHolder
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
    
        textColor = .black
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        minimumFontSize = 12
        
        backgroundColor = .white
        autocorrectionType = .no
        returnKeyType = .go
    }
    

}
