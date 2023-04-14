//
//  GenCodeViewModel.swift
//  Runner
//
//  Created by mohamed on 7/4/2023.
//

import Foundation
extension CodeView{
    class GenCodeRepViewModel : ObservableObject {
        
        @MainActor @Published var response: String? = nil
        @MainActor @Published var internalError: String? = nil
        
        func handleVerifyCode(req: GenCodeRep) async -> Void {
            
            let res: GenericResponse? = await AuthRepo.verifCode(verifCode: req)
            
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
                    self.internalError = "Code verified successfully"
                }
            }
        }
        
    }
}
