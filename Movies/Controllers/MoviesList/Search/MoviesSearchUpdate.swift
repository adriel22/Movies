//
//  MoviesListViewController+Search.swift
//  Movies
//
//  Created by Adriel Freire on 06/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import UIKit

extension MoviesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

        if let name = searchController.searchBar.text {
            self.searchName = name
        }

        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(searchMovies),
                                         userInfo: nil, repeats: false)
    }

    @objc func searchMovies() {

        let service = MovieService.searchMovie(searchName)
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

}
