//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Goodwasp on 16.10.2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject private var userManager: UserManager
    
    private var validation: Bool {
        name.count > 2
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .border(Color.black)
                Text(name.count.formatted())
                    .foregroundStyle(validation ? .green : .red)
            }
            .padding()
            Button(action: registerUser ) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!validation)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            userManager.name = name
            userManager.isRegister.toggle()
        }
    }
}

#Preview {
    RegisterView()
}
