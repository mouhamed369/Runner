//
//  SignUpViewModel.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 21/3/2023.
//

import Foundation


extension SignUpController {
    
    class SingUpViewModel : ObservableObject {
        
        @MainActor @Published var response: String? = nil
        @MainActor @Published var internalError: String? = nil
        
        func handleSignUpRequest(req: SignUpRequest) async -> Void {
            
            let res: GenericResponse? = await AuthRepo.signUpReq(userDetails: req)
            
            if res != nil {
                
                await MainActor.run {
                    
                    if (res!.code > 400) {
                        self.response = nil
                        self.internalError = res?.message
                        return
                    }
                    
                    self.response = res!.message
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
