//
//  SignUpRequest.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 21/3/2023.
//

import Foundation

struct SignUpRequest: Encodable {
    var email: String
    var password: String
    var name:String
    var phone:String
}
