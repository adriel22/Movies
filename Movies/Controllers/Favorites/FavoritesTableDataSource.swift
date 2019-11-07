//
//  FavoritesTableDataSource.swift
//  Movies
//
//  Created by Adriel Freire on 07/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import UIKit
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomTableViewCell else {
                return UITableViewCell()
        }
        let movie = self.movies[indexPath.row]
        cell.title.text = movie.name
        cell.subTitle.text = movie.genres
        if let imageData = movie.image {
            cell.icon.image = UIImage(data: imageData)
        }
        return cell
    }

}
