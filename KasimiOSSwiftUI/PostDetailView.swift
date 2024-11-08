//
//  PostDetailView.swift
//  KasimiOSSwiftUI
//
//  Created by Sefa Aycicek on 8.11.2024.
//

import SwiftUI

struct PostDetailView: View {
    var selectedPost : PostEntity
    var body: some View {
        VStack {
            Text(selectedPost.title)
        }.navigationTitle("Post Detay")
    }
}

#Preview {
    PostDetailView(selectedPost: PostEntity(id: 0, userId: 0, title: "123123", body: ""))
}
