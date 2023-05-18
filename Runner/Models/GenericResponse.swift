//
//  GenericResponse.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 21/3/2023.
//

import Foundation
class GenericResponse: Decodable {
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case message
    }
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.message = try container.decode(String.self, forKey: .message)
    }
}
