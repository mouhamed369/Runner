//
//  Articles.swift
//  Runner
//
//  Created by mohamed on 18/4/2023.
//

import Foundation

class Article : Decodable, Hashable, Identifiable {
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    var id: UUID = UUID()
    var title : String?
    var link: String?
    var pubDate : Date?
    var image: String?
    var content : String?
    var tags : [String]?
    var aId : Int?

    enum CodingKeys: String, CodingKey {
        case title
        case link
        case pubDate
        case image
        case content
        case tags
        case aId
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.link = try container.decodeIfPresent(String.self, forKey: .link)
        self.pubDate = try container.decodeIfPresent(Date.self, forKey: .pubDate)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
        self.tags = try container.decodeIfPresent([String].self, forKey: .tags)
        self.aId = try container.decodeIfPresent(Int.self, forKey: .aId)
    }
}
