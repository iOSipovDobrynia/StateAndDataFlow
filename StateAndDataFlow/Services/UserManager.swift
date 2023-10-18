//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Goodwasp on 16.10.2023.
//

import Foundation
import SwiftUI

final class UserManager: ObservableObject {
    @Published var user = User()
    
    var validation: Bool {
        user.name.count > 2
    }
    
    init() {}
    
    init(user: User = User()) {
        self.user = user
    }
}
