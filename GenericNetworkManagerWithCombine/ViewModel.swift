//
//  ViewModel.swift
//  GenericNetworkManagerWithCombine
//
//  Created by İhsan Akbay on 2.04.2024.
//

import Combine
import SwiftUI

@Observable
final class ViewModel {
    var posts: [ResponseModel] = .init()
    private var request: RequestModel = .init(title: "Test Post 1", body: "Test Post Body 1", userId: 999)
    private var cancelable = Set<AnyCancellable>()

    @MainActor
    func createPost() {
        NetworkClient.dispatch(NetworkRouter.createPost(body: request))
            .sink { [weak self] completion in
                guard let self else { return }
                switch completion {
                case .finished:
                    print("Post created successfully")
                case .failure(let error):
                    print("Failed to create post with error: \(error)")
                }
            } receiveValue: { response in
                print(response)
                self.fetchPosts()
            }
            .store(in: &cancelable)
    }

    @MainActor
    func fetchPosts() {
        NetworkClient.dispatch(NetworkRouter.fetchPosts())
            .sink { [weak self] completion in
                guard let self else { return }
                switch completion {
                case .finished:
                    print("Fetched posts successfully")
                case .failure(let error):
                    print("Failed to fetch posts with error: \(error)")
                }
            } receiveValue: { [weak self] response in
                self?.posts = response
                print(response)
            }
            .store(in: &cancelable)
    }
}
