//
//  FavoritesViewController.swift
//  Movies
//
//  Created by Adriel Freire on 07/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import UIKit
class FavoritesViewController: UIViewController {
    private let customView = MoviesListView()
    private let coreDataManager = CoreDataManager()
    var movies = [Movie]() {
        didSet {
            DispatchQueue.main.async {
                self.customView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.dataSource = self
        customView.delegate = self
        setNavigation()
    }
    override func loadView() {
        super.loadView()
        self.view = customView
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let movies = coreDataManager.fetchMovies() {
            self.movies = movies
        }
    }

    private func setNavigation() {
        self.title = "Favorites"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }

}
