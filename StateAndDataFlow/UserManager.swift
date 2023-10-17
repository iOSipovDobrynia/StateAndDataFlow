//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Goodwasp on 16.10.2023.
//

import Foundation
import SwiftUI

class UserManager: ObservableObject {
    @AppStorage("isRegister") var isRegister = false
    @AppStorage("name") var name = ""
}
