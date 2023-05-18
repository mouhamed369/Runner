//
//  forgetPasswordReq.swift
//  Runner
//
//  Created by mohamed on 7/4/2023.
//

import Foundation
extension ForgetPasswordView{
    class ForgetPasswordViewModel : ObservableObject {
        
        @MainActor @Published var response: String? = nil
        @MainActor @Published var internalError: String? = nil
        
        func handleForgetPassword(req: forgetPasswordReq) async -> Void {
            
            let res: GenericResponse? = await AuthRepo.resetPassRep(resetPassReq: req)
            
            if (res != nil) {
                
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
                    self.internalError = "Code generated successfully"
                }
            }
        }
        
    }
    
}
