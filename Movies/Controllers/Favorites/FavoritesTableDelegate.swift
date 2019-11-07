//
//  FavoritesTableDelegate.swift
//  Movies
//
//  Created by Adriel Freire on 07/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import UIKit
extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell {

            let movie = self.movies[indexPath.row]
            if let name = movie.name, let overview = movie.overview, let date = movie.date {
                let movieDTO = MovieDTO(title: name, overview: overview, poster: "", releaseDate: date, genreIDs: [])
                let controller = MoviesDetailsViewController(movie: movieDTO,
                                                            image: cell.icon.image, genres: cell.subTitle.text)
                self.navigationController?.pushViewController(controller, animated: true)
            }

        }
    }

}
