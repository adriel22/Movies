//
//  EncodableExtension.swift
//  Movies
//
//  Created by Adriel Freire on 06/11/19.
//  Copyright © 2019 Adriel Freire. All rights reserved.
//

import Foundation
extension Encodable {

    /// Encode it self to a data type
    ///
    /// - Returns: data type
    func asData() -> Data? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try? encoder.encode(self)
        return data
    }
}
