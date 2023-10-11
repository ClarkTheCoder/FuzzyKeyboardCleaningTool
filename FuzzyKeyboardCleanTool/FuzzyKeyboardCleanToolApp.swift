//
//  FuzzyKeyboardCleanToolApp.swift
//  FuzzyKeyboardCleanTool
//
//  Created by carson on 2023-10-11.
//

import SwiftUI
import AppKit

@main
struct FuzzyKeyboardCleanToolApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fixedSize()
        }
        .windowResizability(.contentSize)
    }
}

