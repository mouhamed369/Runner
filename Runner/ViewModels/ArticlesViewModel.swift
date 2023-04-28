//
//  ArticlesViewModel.swift
//  Runner
//
//  Created by mohamed on 19/4/2023.
//

import Foundation


public class ArticlesViewModel : ObservableObject {
    
    @Published var articles = [Article]()
    
    func downloadArticles() async  {
        
        self.articles = await ArticleRepo.downloadArticles()
    }
}

