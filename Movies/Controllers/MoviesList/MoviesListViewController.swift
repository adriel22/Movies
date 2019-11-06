//
//  MoviesListViewController.swift
//  Movies
//
//  Created by Adriel Freire on 06/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import UIKit
class MoviesListViewController: UIViewController {
    var movies: [MovieDTO] = [] {
        didSet {
            DispatchQueue.main.async {
                self.customView.reloadData()
            }
        }
    }
    var genres: [GenreDTO] = [] {
        didSet {
            DispatchQueue.main.async {
                self.customView.reloadData()
            }
        }
    }
    private let customView = MoviesListView()
    let dispatch = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.dataSource = self
        customView.delegate = self
        requestGenres()
        requestMovies()
        self.setNavigation()
    }

    override func loadView() {
        super.loadView()
        self.view = customView
    }

    private func setNavigation() {
        self.title = "Movies"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Search for a movie"
        self.navigationItem.searchController = search
    }

    func requestMovies() {
        let service = MovieService.getTrendingMovies
        let session = URLSessionProvider()
        session.request(type: TrendingMovies.self, service: service) { (result) in
            switch result {
            case .success(let result):
                self.movies = result.movies
            case .failure(let error):
                print(error)
            }
        }
    }

    private func requestGenres() {
        let service = MovieService.getGenres
        let session = URLSessionProvider()
        session.request(type: GenresDTO.self, service: service) { (result) in
            switch result {
            case .success(let genres) :
                self.genres = genres.genres
            case .failure(let error):
                print(error)
            }
        }
    }

}
