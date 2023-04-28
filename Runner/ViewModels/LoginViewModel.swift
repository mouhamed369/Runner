//
//  LoginViewModel.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 23/3/2023.
//

import Foundation

extension ViewController {
    
    class LoginViewModel : ObservableObject {
        
        @MainActor @Published var response: String? = nil
        @MainActor @Published var internalError: String? = nil
        
        func handleLoginRequest(req: LoginRequest) async  -> Void {
        
            let res: LoginResponse? = await AuthRepo.loginReq(loginReq: req)
            
            if res != nil {
                
                await MainActor.run {
                    
                    if (res!.code > 400) {
                        self.response = nil
                        self.internalError = res?.message
                        return
                    }
                    
                    self.response = "Logging you in..."
                    self.internalError = nil
                }
            }
            else {
               await MainActor.run {
                   self.internalError = "Error sending your request!"
                }
            }
        }
        
    }
}
