//
//  TrendingMovies.swift
//  Movies
//
//  Created by Adriel Freire on 06/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import Foundation
struct TrendingMovies: Codable {
    let movies: [MovieDTO]

    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
