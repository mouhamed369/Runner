//
//  LoginReqResp.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 23/3/2023.
//

import Foundation

struct LoginRequest: Encodable {
    
    var username: String;
    var password: String;
}

class LoginResponse : Decodable {
    
    var message: String
    var code: Int
    var token: String?
    
    enum CodingKeys: String, CodingKey {
        case message
        case code
        case token
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
        self.token = try container.decodeIfPresent(String.self, forKey: .token)
        self.code = try container.decode(Int.self, forKey: .code)
    }
    
    public func LoginResponse(message: String, token: String?, code: Int) {
        self.message = message
        self.token = token
        self.code = code
    }
}
