//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Goodwasp on 16.10.2023.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    private let user = DataManager.shared.fetchUser()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
