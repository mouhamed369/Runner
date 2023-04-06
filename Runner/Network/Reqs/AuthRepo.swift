//
//  Auth.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 22/3/2023.
//

import Foundation
import Alamofire

final class AuthRepo : DataParser {
    
    static func signUpReq(userDetails: SignUpRequest) async -> GenericResponse? {
        do {
            
            let headers : HTTPHeaders = [
                "Content-Type": "application/json"
            ]
            
            let resp = try await NetworkManager.shared.post(path: "Signup", parameters: userDetails, headers: headers)
            
            let data: GenericResponse = try self.parseData(data: resp)
            
            return data
            
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    static func loginReq(loginReq: LoginRequest) async -> LoginResponse?  {
        
        do {
            
            let headers : HTTPHeaders = [
                "Content-Type": "application/json",
                //"Accept": "application/json"
            ]
            
            let resp = try await NetworkManager.shared.post(path: "login", parameters: loginReq, headers: headers)
            
            let data: LoginResponse = try self.parseData(data: resp)
            
            return data
            
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
}
