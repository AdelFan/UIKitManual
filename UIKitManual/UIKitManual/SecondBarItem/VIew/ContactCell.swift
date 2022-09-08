//
//  ContactCell.swift
//  UIKitManual
//
//  Created by Адель Ахметшин on 08.09.2022.
//

import Foundation
import UIKit

class ContactCell: UITableViewCell {
    private let avatar: UIImageView = {
       let avatar = UIImageView()
        return avatar
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.textColor = .lightGray
        return label
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings
    private func setupCell() {
        [avatar, nameLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatar.heightAnchor.constraint(equalToConstant: 32),
            avatar.widthAnchor.constraint(equalToConstant: 32),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(contact: Contact) {
        avatar.image = contact.image
        nameLabel.text = contact.name
        descriptionLabel.text = contact.description
    }
}
