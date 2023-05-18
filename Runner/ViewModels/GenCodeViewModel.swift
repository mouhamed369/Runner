//
//  GenCodeViewModel.swift
//  Runner
//
//  Created by mohamed on 7/4/2023.
//

import Foundation

class GenCodeViewModel : ObservableObject {
    
    func handleVerifyCode(email: String) async -> Int {
        
        let res: GenericResponse? = await AuthRepo.findEmail(email: email)
        
        if (res != nil) {
            return 200
        }
        else {
            
            return 400
        }
    }
    
    func handleResetPassword(password: String, code: String) async -> Int {
        
        let res: GenericResponse? = await AuthRepo.resetPassword(resetPassReq: ResetPwdBody(ActivationCode: code, Password: password))
        
        if (res != nil) {
            return 200
        }
        else {
            return 400
        }
    }
}
