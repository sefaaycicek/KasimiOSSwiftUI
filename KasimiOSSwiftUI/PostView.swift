//
//  PostView.swift
//  KasimiOSSwiftUI
//
//  Created by Sefa Aycicek on 8.11.2024.
//

import SwiftUI

struct PostView: View {
    @ObservedObject var viewModel = PostViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TextField("Search", text: $viewModel.searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    List(viewModel.filteredData) { item in
                        NavigationLink {
                            PostDetailView(selectedPost: item)
                        } label: {
                            Text(item.title)
                        }
                
                    }
                }
                
                if(viewModel.filteredData.isEmpty) {
                    Spacer()
                    Text("No data found")
                    Spacer()
                }
            }.padding()
                .navigationTitle("Post Listesi")
                .navigationBarItems(trailing: PostViewTopButtons())
        }.onAppear() {
            viewModel.getData()
        }
    }
}

struct PostViewTopButtons: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Image(systemName: "person.crop.circle")
            })
            Button(action: {
                
            }, label: {
                Image(systemName: "person.crop.circle")
            })
        }
        
    }
}

#Preview {
    PostView()
}



/*
 struct PostView: View {
     
     @State private var posts: [PostEntity] = []
     var viewModel = ViewControllerViewModel()
     
     var body: some View {
         VStack {
             ForEach(0..<50, id: \.self) { item in
                 if(posts.count > 50) {
                     Text("\(posts[item].title)")
                 }
             }
             Text("number of items : \(posts.count)")
         }.onAppear() {
             viewModel.data.subscribe { postList in
                 self.posts = postList
             }.disposed(by: viewModel.disposeBag)
             
             viewModel.getData()
             
             
         }
     }
 }
 */
