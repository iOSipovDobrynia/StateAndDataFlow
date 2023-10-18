//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Goodwasp on 16.10.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hi, \(userManager.user.name)")
                .font(.system(size: 40))
            Spacer()
            Text(timer.counter.formatted())
                .font(.largeTitle)
            Spacer()
            TimerButtonView(timer: timer)
            Spacer()
            Button(role: .destructive, action: {
                DataManager.shared.clear(userManager: userManager)
            }) {
                Text("Log Out")
                    .font(.system(size: 30))
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager())
}

struct TimerButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: { timer.start() }) {
            Text(timer.buttonTitle)
                .font(.system(size: 40))
        }
        .buttonStyle(.borderedProminent)
    }
}
