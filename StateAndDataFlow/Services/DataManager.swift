//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Goodwasp on 18.10.2023.
//

import SwiftUI

final class DataManager {
    static let shared = DataManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func fetchUser() -> User {
        guard let userData = userData else { return User() }
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else { return User()}
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.name = ""
        userManager.user.isRegister = false
        userData = nil
    }
}
