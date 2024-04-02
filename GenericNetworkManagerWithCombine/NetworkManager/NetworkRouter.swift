//
//  NetworkRouter.swift
//  GenericNetworkManagerWithCombine
//
//  Created by İhsan Akbay on 2.04.2024.
//

import Foundation

class NetworkRouter {
    struct fetchPosts: NetworkRequest {
        typealias ReturnType = [ResponseModel]
        var path: String = "/posts"
        var method: HttpMethod = .get
        var body: [String : Any]?
        
    }
    
    // you can add a new struct for each request now
    struct createPost: NetworkRequest {
        typealias ReturnType = ResponseModel
        var path: String = "/posts"
        var method: HttpMethod = .post
        var body: [String : Any]?
        
        init(body: RequestModel) {
            self.body = body.asDictionary
        }
    }
    
}
