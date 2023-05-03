//
//  APIReqs.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 21/3/2023.
//

import Foundation

public class DataParser {
    // FIX: Swiftier method name
    static func parseData<T: Decodable>(from data: Data) throws -> T {
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data)
        else {
            throw NSError(
                domain: "NetworkAPIError",
                code: 3,
                userInfo: [NSLocalizedDescriptionKey: "Error while handling your request."]
            )
        }
        return decodedData
    }
}
