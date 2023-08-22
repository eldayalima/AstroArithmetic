//
//  WelcomeViewModel.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import SwiftUI

@MainActor
class WelcomeViewModel: ObservableObject {
    @Published var blinking = false
    @Published var isRotated = false
    
    init(blinking: Bool = false, isRotated: Bool = false) {
        self.blinking = blinking
        self.isRotated = isRotated
    }
}

