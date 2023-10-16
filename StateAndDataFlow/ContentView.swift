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
            Text("Hi, \(userManager.name)")
            Spacer()
            Text(timer.counter.formatted())
                .font(.largeTitle)
            
            Spacer()
            
            ButtonView(timer: timer)
            
            Spacer()
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager())
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: { timer.start() }) {
            Text(timer.buttonTitle)
                .font(.system(size: 40))
        }
        .buttonStyle(.borderedProminent)
    }
}
