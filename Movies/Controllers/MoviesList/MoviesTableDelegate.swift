//
//  MoviesTableDelegate.swift
//  Movies
//
//  Created by Adriel Freire on 06/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import UIKit
extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell {

            let controller = MoviesDetailViewController(movie: self.movies[indexPath.row],
                                                        image: cell.icon.image, genres: cell.subTitle.text)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
