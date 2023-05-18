//
//  GenCodeReq.swift
//  Runner
//
//  Created by mohamed on 7/4/2023.
//

import Foundation
struct ResetPwdBody : Codable {
    let ActivationCode : String
    let Password : String
}
