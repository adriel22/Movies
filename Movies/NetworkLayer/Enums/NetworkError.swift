//
//  NetworkError.swift
//  Movies
//
//  Created by Adriel Freire on 06/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import Foundation
public enum NetworkError: Error {
    case unknown
    case clientError(statusCode: Int, dataResponse: String)
    case serverError(statusCode: Int, dataResponse: String)
    case decodeError(String)
    case noJSONData
}
