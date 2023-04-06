//
//  Helpers.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 23/3/2023.
//

import Foundation
import SwiftUI
import UIKit

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

