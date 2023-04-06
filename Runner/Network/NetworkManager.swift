//
//  NetworkManager.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 21/3/2023.
//

import Foundation
import Alamofire

actor NetworkManager: GlobalActor {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let maxWaitTime = 100.0
    
    func get<T: Encodable>(path: String, parameters: T?, headers: HTTPHeaders) async throws -> Data {
        // You must resume the continuation exactly once
        return try await self.call(
            path:path,
            parameters: parameters,
            headers: headers,
            method: HTTPMethod.get
        )
    }
    
    func post<T: Encodable>(path: String, parameters: T?, headers: HTTPHeaders) async throws -> Data {
        return try await self.call(
            path:path,
            parameters:parameters,
            headers: headers,
            method: HTTPMethod.post
        )
    }
    
    func patch<T: Encodable>(path: String, parameters: T?, headers: HTTPHeaders) async throws -> Data {
        return try await self.call(
            path:path,
            parameters:parameters,
            headers: headers,
            method: HTTPMethod.patch
        )
    }
    
    func put<T: Encodable>(path: String, parameters: T?, headers: HTTPHeaders) async throws -> Data {
        return try await self.call(
            path:path,
            parameters:parameters,
            headers: headers,
            method: HTTPMethod.put
        )
    }
    
    func delete<T: Encodable>(path: String, parameters: T?, headers: HTTPHeaders) async throws -> Data {
        return try await self.call(
            path:path,
            parameters: parameters,
            headers: headers,
            method: HTTPMethod.delete
        )
    }
    
    private func call<T: Encodable>(path: String, parameters: T?, headers: HTTPHeaders, method: HTTPMethod) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                "\(Consts.ENDPOINT)/\(path)",
                method: method,
                parameters: parameters,
                encoder: .json,
                headers: headers,
                requestModifier: { $0.timeoutInterval = self.maxWaitTime }
            )
            .response { response in
                switch(response.result) {
                    
                case let .success(data):
                    continuation
                        .resume(returning: data!)
                    
                case let .failure(error):
                    continuation
                        .resume(
                            throwing:
                                self.handleError(error: error)
                        )
                }
            }
        }
    }
    
    private func handleError(error: AFError) -> Error {
        if let underlyingError = error.underlyingError {
            let nserror = underlyingError as NSError
            let code = nserror.code
            if code == NSURLErrorNotConnectedToInternet ||
                code == NSURLErrorTimedOut ||
                code == NSURLErrorInternationalRoamingOff ||
                code == NSURLErrorDataNotAllowed ||
                code == NSURLErrorCannotFindHost ||
                code == NSURLErrorCannotConnectToHost ||
                code == NSURLErrorNetworkConnectionLost
            {
                var userInfo = nserror.userInfo
                userInfo[NSLocalizedDescriptionKey] = "Unable to connect to the server"
                let currentError = NSError(
                    domain: nserror.domain,
                    code: code,
                    userInfo: userInfo
                )
                return currentError
            }
        }
        return error
    }
}
