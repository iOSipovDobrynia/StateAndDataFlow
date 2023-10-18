//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Goodwasp on 16.10.2023.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $userManager.user.name)
                    .multilineTextAlignment(.center)
                Text(userManager.user.name.count.formatted())
                    .foregroundStyle(userManager.validation ? .green : .red)
            }
            .padding()
            Button(action: registerUser ) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userManager.validation)
        }
    }
    
    private func registerUser() {
        DataManager.shared.save(user: userManager.user)
        userManager.user.isRegister.toggle()
    }
}

#Preview {
    RegisterView()
}
