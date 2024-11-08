//
//  PostViewModel.swift
//  KasimiOSSwiftUI
//
//  Created by Sefa Aycicek on 8.11.2024.
//

import UIKit
import RxSwift
import RxRelay

class PostViewModel : ObservableObject {
    let disposeBag = DisposeBag()
    
    @Published var searchText : String = ""
    @Published var filteredData = [PostEntity]()
    @Published var isLoading = false

    var originalData : [PostEntity] = []
    
    let apiService : AlamofireApiServiceProtocol
    init(apiService : AlamofireApiServiceProtocol = AlamofireApiService()) {
        self.apiService = apiService
        
        observeFilter()
    }
    
    func getData() {
        self.apiService.fetchPosts()
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onSuccess: { [weak self] posts in
                self?.originalData = posts ?? []
                self?.filteredData = posts ?? []
            }, onFailure: { error in
                
            }).disposed(by: disposeBag)
                       
    }
    
    func observeFilter() {
       // let filteredData = self.originalData.filter { prm.isEmpty || $0.title.lowercased().contains(prm.lowercased()) }
       // self.data.accept(filteredData)
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { query in
                self.originalData.filter({ query.isEmpty ||  $0.title.lowercased().contains(query.lowercased()) })
            }.assign(to: &$filteredData)
        
    }
    
}
