//
//  MoviesDetailViewController.swift
//  Movies
//
//  Created by Adriel Freire on 06/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import UIKit

class MoviesDetailsViewController: UIViewController {

    private let customView = DetailsView()
    private let movie: MovieDTO
    private let image: UIImage?
    private let genres: String?
    private let star = UIBarButtonItem(image: UIImage(systemName: "star"), style: .done,
    target: self, action: #selector(favoritesButtonAction))
    init(movie: MovieDTO, image: UIImage?, genres: String?) {
        self.movie = movie
        self.image = image
        self.genres = genres
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        setNavigationBar()
        setView()
    }

    override func loadView() {
        super.loadView()
        self.view = customView
    }

    private func setNavigationBar() {
        self.title = movie.title
        self.navigationController?.navigationBar.prefersLargeTitles = false
        let button = UIButton()
        star.target = self
        star.action = #selector(favoritesButtonAction)
        button.setImage(UIImage(systemName: "star"), for: .normal)
        self.navigationItem.rightBarButtonItem = star
    }

    @objc func favoritesButtonAction() {

    }

    private func toggleBarButtonIcon() {
        if star.image == UIImage(systemName: "star") {
            star.image = UIImage(systemName: "star.fill")
        } else {
            star.image = UIImage(systemName: "star")
        }
    }

    private func setView() {
        customView.imageView.image = self.image
        customView.content.text = movie.overview
        customView.tagLabel.text = self.genres
        customView.date.text = movie.releaseDate
    }
}
