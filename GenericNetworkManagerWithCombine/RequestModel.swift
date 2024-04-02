//
//  RequestModel.swift
//  GenericNetworkManagerWithCombine
//
//  Created by İhsan Akbay on 3.04.2024.
//

import Foundation

struct RequestModel: Codable {
    let title: String
    let body: String
    let userId: Int

    init(title: String, body: String, userId: Int) {
        self.title = title
        self.body = body
        self.userId = userId
    }
}
