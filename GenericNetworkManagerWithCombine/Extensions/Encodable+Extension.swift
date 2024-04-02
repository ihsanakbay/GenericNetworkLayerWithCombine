//
//  Encodable+Extension.swift
//  GenericNetworkManagerWithCombine
//
//  Created by İhsan Akbay on 2.04.2024.
//

import Foundation

extension Encodable {
    var asDictionary: [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            return [:]
        }
        return dictionary
    }
}
