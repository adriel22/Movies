//
//  DetailsView.swift
//  Movies
//
//  Created by Adriel Freire on 06/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import UIKit
class DetailsView: UIView {
    private let imageSize = UIScreen.main.bounds.width / 2
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let date: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let font: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let tagLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var content: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = .systemFont(ofSize: 16)
        textView.textAlignment = .justified
        textView.textContainerInset.top = 0
        textView.backgroundColor = .clear
        textView.sizeToFit()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpView() {
        self.addSubview(scrollView)
        self.backgroundColor = .white
        setUpScroll()
    }

    private func setUpScroll() {
        scrollView.addSubview(title)
        scrollView.addSubview(date)
        scrollView.addSubview(font)
        scrollView.addSubview(imageView)
        scrollView.addSubview(content)
        scrollView.addSubview(tagLabel)
        scrollView.backgroundColor = UIColor.white
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
    }
    private func setUpConstraints() {
        ///title constraints
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            title.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
        ///dateLabel constraints
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            date.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            date.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, multiplier: 0.5)
        ])
        ///font constraints
        NSLayoutConstraint.activate([
            font.topAnchor.constraint(equalTo: date.topAnchor),
            font.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            font.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor, multiplier: 0.5)
        ])
        ///imageView constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.4)
        ])
        ///content constraints
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 30),
            content.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
        ///tagLabel constraints
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: content.bottomAnchor),
            tagLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            tagLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            tagLabel.heightAnchor.constraint(equalToConstant: 50),
            tagLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}
