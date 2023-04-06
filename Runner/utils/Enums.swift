//
//  Enums.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 21/3/2023.
//

import Foundation

enum CheckoutFocusable: Hashable {
  case username
  case email
  case password
  case confirmPassword
  case phone
}

enum CheckoutLoginFocusable: Hashable {
case email
case password
}
