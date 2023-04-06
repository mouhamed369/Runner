//
//  RefreshTokenResponse.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 22/3/2023.
//

import Foundation

class RefreshTokenResponse : Decodable {
    
    var token: String?;
    var refresh: String?;
    var error: String?;
    
    enum CodingKeys: String, CodingKey {
        case refresh
        case token
        case error
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.refresh = try container.decodeIfPresent(String.self, forKey: .refresh)
        self.token = try container.decodeIfPresent(String.self, forKey: .token)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
    }
    
    public func RefreshTokenResponse(token: String?, refresh: String?, error: String?) {
        
        self.token = token
        self.refresh = refresh
        self.error = error
    }
}
