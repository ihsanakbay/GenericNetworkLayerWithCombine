//
//  ResponseModel.swift
//  GenericNetworkManagerWithCombine
//
//  Created by İhsan Akbay on 2.04.2024.
//

import Foundation

struct ResponseModel: Codable, Identifiable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?

    enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
}
