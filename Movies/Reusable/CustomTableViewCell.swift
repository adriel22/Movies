//
//  CustomTableViewCell.swift
//  Movies
//
//  Created by Adriel Freire on 06/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let icon: UIImageView = {
        let icon = UIImageView()
        icon.layer.cornerRadius = 45/2
        icon.layer.masksToBounds = true
        icon.contentMode = .scaleAspectFill
        icon.backgroundColor = .lightGray
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    let title: UILabel = {
        let title = UILabel()
        title.text = "Teste Title"
        title.numberOfLines = 0
        title.textAlignment = .left
        title.font = .boldSystemFont(ofSize: 16)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let date: UILabel = {
        let date = UILabel()
        date.text = "05/26/2014"
        date.font = .systemFont(ofSize: 14)
        date.textColor = .lightGray
        date.textAlignment = .right
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    let subTitle: UILabel = {
        let subtitle = UILabel()
        subtitle.text = "teste sub title"
        subtitle.font = .systemFont(ofSize: 14)
        subtitle.textColor = .lightGray
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        return subtitle
    }()
    let accessory: UIView = {
        let accessory = UIImageView()
        accessory.image = UIImage(systemName: "chevron.right")
        accessory.contentMode = .center
        accessory.tintColor = UIColor.lightGray
        accessory.translatesAutoresizingMaskIntoConstraints = false
        return accessory
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
        self.setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpView() {
        self.addSubview(icon)
        self.addSubview(title)
        self.addSubview(date)
        self.addSubview(subTitle)
        self.addSubview(accessory)
        self.selectionStyle = .none

    }

    func wasReaded() {
        title.font = .systemFont(ofSize: 16)
        title.textColor = .lightGray
    }
    func wasNotReaded() {
        title.font = .boldSystemFont(ofSize: 16)
        title.textColor = .black
    }

    private func setUpConstraints() {
        ///icon constraints
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 45),
            icon.widthAnchor.constraint(equalToConstant: 45),
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 26),
            icon.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
        ])

        ///title constraints
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            title.heightAnchor.constraint(equalToConstant: 44),
            title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 12),
            title.trailingAnchor.constraint(equalTo: accessory.leadingAnchor, constant: -10)
        ])

        ///subtitle constraints
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
            subTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            subTitle.heightAnchor.constraint(equalToConstant: 16),
            subTitle.trailingAnchor.constraint(equalTo: date.leadingAnchor, constant: -10)
        ])

        ///date constraints
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
            date.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            date.heightAnchor.constraint(equalToConstant: 16),
            date.widthAnchor.constraint(equalToConstant: 100)
        ])

        ///accessory constraints
        NSLayoutConstraint.activate([
            accessory.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            accessory.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            accessory.widthAnchor.constraint(equalToConstant: 8),
            accessory.heightAnchor.constraint(equalToConstant: 13)
        ])

    }

}
