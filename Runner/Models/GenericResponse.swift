//
//  GenericResponse.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 21/3/2023.
//

import Foundation
class GenericResponse: Decodable {
    var message: String
    var code: Int
    
    enum CodingKeys: String, CodingKey {
        case message
        case code
    }
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.message = try container.decode(String.self, forKey: .message)
        self.code = try container.decode(Int.self, forKey: .code)
    }
    
    public func GenericResponse(message: String, code: Int) {
        self.message = message
        self.code = code
    }
}
