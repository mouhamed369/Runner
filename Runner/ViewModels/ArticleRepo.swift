//
//  ArticlesRepo.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 7/4/2023.
//

import Foundation

final class ArticlesRepo: DataParser {
    static func getArticles(page: Int) async -> Result<ArticlePage, Error> {
        do {
            let resonse = try await NetworkManager.shared.get(path: "articles/?page=\(page)")
            let data: ArticlePage = try self.parseData(from: resonse)
            return .success(data)
        } catch let error {
       
            return .failure(error)
        }
    }
}
