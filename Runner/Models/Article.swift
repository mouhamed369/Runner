//
//  Articles.swift
//  Runner
//
//  Created by mohamed on 18/4/2023.
//

import Foundation

//
//  ArticlePage.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 30/4/2023.
//

import Foundation

class ArticlePage : Decodable, Hashable {
    
    
    static func == (lhs: ArticlePage, rhs: ArticlePage) -> Bool {
        lhs.articles == rhs.articles
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(page)
    }
    
    
    var page: Int
    var pageSize: Int
    var total: Int
    var pages: Int
    var articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        
        case page
        case pageSize
        case total
        case pages
        case articles
    }
    
    public required init(from decoder: Decoder) throws {
        let container =  try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.pageSize = try container.decode(Int.self, forKey: .pageSize)
        self.total = try container.decode(Int.self, forKey: .total)
        self.pages = try container.decode(Int.self, forKey: .pages)
        self.articles = try container.decode([Article].self, forKey: .articles)
    }
    
}


class Article : Decodable, Hashable, Identifiable {
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.aId == rhs.aId
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(aId)
    }
    
    var id: UUID = UUID()
    var aId: Int
    var title: String
    var link: String
    var pubDate: String
    var image: String
    var content: String
    var tags: [String]
    
    public func Article(a: Article) {
        self.aId = a.aId
        self.title = a.title
        self.link = a.link
        self.pubDate = a.pubDate
        self.image = a.image
        self.content = a.content
        self.tags = a.tags
    }
    
    enum CodingKeys: String, CodingKey {
        case aId
        case title
        case link
        case pubDate
        case image
        case content
        case tags
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.aId = try container.decode(Int.self, forKey: .aId)
        self.title = try container.decode(String.self, forKey: .title)
        self.link = try container.decode(String.self, forKey: .link)
        self.pubDate = try container.decode(String.self, forKey: .pubDate)
        self.image = try container.decode(String.self, forKey: .image)
        self.content =  try container.decode(String.self, forKey: .content)
        self.tags = try container.decode([String].self, forKey: .tags)
    }
}
