//
//  MoviesListView.swift
//  Movies
//
//  Created by Adriel Freire on 06/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import UIKit
class MoviesListView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        self.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        self.backgroundColor = .white
        self.rowHeight = 80
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
