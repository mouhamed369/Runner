//
//  ArticlesViewModel.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 7/4/2023.
//

import Foundation
import SwiftUI

// FIX: Removed @MainActor, while cool, this is a ViewModel, it's not an object in danged of being used from muiltiple threads
class ArticlesViewModel: ObservableObject {
    @Published var articles: [Article] = []
    
    // FIX: First page needs to be 1, changed the name for clarity
    private var latestFetchedPage = 0
    private var pages = 0
    
    // FIX: Was true, preventing initial loading from starting
    var isLoading = false
    
    init() {
        // FIX: Since loading is triggered when an article is shown, when the list is empty, nobody can start loading the initial set of articles
        Task {
            await loadMore()
        }
    }
    
    
    func didShow(article: Article) {
        guard !isLoading else { return }
        guard isNearEndOfArticlesList(article) else { return }
        Task {
            await loadMore()
        }
    }

    private func isNearEndOfArticlesList(_ article: Article) -> Bool {
        guard let index = articles.firstIndex(of: article) else { return false }
        let articlesLeft = articles.count - index
        return articlesLeft < 10
    }

    private func loadMore() async {
        isLoading = true
        // FIX: You were always fetching the last page
        // FIX: Now using Result<T, E>
        let result = await ArticlesRepo.getArticles(page: latestFetchedPage+1)
        switch result {
        case .success(let data): handle(response: data)
        case .failure(let error): print("Error fetching articles: \(error)")
        }
        isLoading = false
    }

    // FIX: Moved response handling to a dedicated function
    private func handle(response: ArticlePage) {
        Task { @MainActor in
            // FIX: Using automatic animation, probably nothing changes in the UI, but it's nice to have
            withAnimation(.easeInOut(duration: 1.2)) {
                // FIX: You were replacing the list, need to append instead
                articles.append(contentsOf: response.articles)
                latestFetchedPage = response.page
                pages = response.pages
            }
        }
    }
}
