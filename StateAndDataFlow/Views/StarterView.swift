//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Goodwasp on 16.10.2023.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        Group {
            if userManager.user.isRegister {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

#Preview {
    StarterView()
        .environmentObject(UserManager())
}
