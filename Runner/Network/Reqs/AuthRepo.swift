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
            
            let data: GenericResponse = try self.parseData(from: resp)
            
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
            
            let data: LoginResponse = try self.parseData(from: resp)
            
            return data
            
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
        
    }
    static func resetPassRep(resetPassReq : forgetPasswordReq) async ->  GenericResponse?{
        do{
            let headers : HTTPHeaders = [
                "Content-Type": "application/json",
                //"Accept": "application/json"
            ]
            let resp = try await NetworkManager.shared.post(path: "resetpassword", parameters: resetPassReq, headers: headers)
            
            let data: GenericResponse = try self.parseData(from: resp)
            
            return data
            
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
        
    }
    static func verifCode(verifCode: GenCodeRep) async ->  GenericResponse?{
        do{
            let headers : HTTPHeaders = [
                "Content-Type": "application/json",
                //"Accept": "application/json"
            ]
            let resp = try await NetworkManager.shared.post(path: "findEmail", parameters: verifCode, headers: headers)
            
            let data: GenericResponse = try self.parseData(from: resp)
            
            return data
            
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
        
    }
    static func unsecurechangepassword(resetPassword: SignUpRequest) async ->  GenericResponse?{
        do{
            let headers : HTTPHeaders = [
                "Content-Type": "application/json",
                //"Accept": "application/json"
            ]
            let resp = try await NetworkManager.shared.post(path: "resetpassword", parameters: resetPassword, headers: headers)
            
            let data: GenericResponse = try self.parseData(from: resp)
            
            return data
            
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    
    
    
    
}
    

