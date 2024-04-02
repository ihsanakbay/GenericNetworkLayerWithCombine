//
//  ContentView.swift
//  GenericNetworkManagerWithCombine
//
//  Created by İhsan Akbay on 2.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var vm: ViewModel = .init()

    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.posts) { post in
                    VStack(alignment: .leading, content: {
                        Text("\(post.id ?? 0)")
                        Text(post.title ?? "")
                    })
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        vm.createPost()
                        
                    }, label: {
                        Text("Add")
                    })
                }
            })
            .onAppear(perform: {
                vm.fetchPosts()
        })
        }
    }
}

#Preview {
    ContentView()
}
