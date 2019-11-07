//
//  MoviesTableDataSource.swift
//  Movies
//
//  Created by Adriel Freire on 06/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import UIKit
extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomTableViewCell else {
                return UITableViewCell()
        }

        let movie = self.movies[indexPath.row]
        cell.title.text = movie.title
        cell.date.text = movie.releaseDate
        cell.icon.image = nil

        let movieGenres = genres.filter {movie.genreIDs.contains($0.id)}
        var movieGenresName = "Genres: "
        movieGenres.forEach({
            movieGenresName += "\($0.name), "
        })
        cell.subTitle.text = movieGenresName

        let service = MovieService.getImage(movie.poster)
        let session = URLSessionProvider()
        session.request(type: Data.self, service: service) { (result) in
            switch result {
            case .success(let data):
                DispatchQueue.main.sync {
                    cell.icon.image = UIImage(data: data)
                }
            case .failure(let error):
                print(error)
            }
        }

        return cell
    }
}
