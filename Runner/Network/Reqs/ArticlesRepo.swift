//
//  ArticlesRepo.swift
//  Runner
//
//  Created by mohamed on 19/4/2023.
//

import Foundation
import Alamofire

final class ArticleRepo : DataParser {
    
    static func downloadArticles() async -> [Article] {
        do {
            
            let headers : HTTPHeaders = [
                "Accept": "application/json"
            ]
            
            let resp = try await NetworkManager.shared.get(path: "articles", headers: headers)
            
            return try self.parseData(data: resp)
            
        }
        catch let error {
            print(error.localizedDescription)
            return []
        }
    }
}
