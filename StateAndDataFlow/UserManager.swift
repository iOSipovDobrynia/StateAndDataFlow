//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Goodwasp on 16.10.2023.
//

import Foundation

class UserManager: ObservableObject {
    @Published var isRegister = false
    var name = ""
}
