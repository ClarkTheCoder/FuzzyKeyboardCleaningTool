//
//  ContentView.swift
//  FuzzyKeyboardCleanTool
//
//  Created by carson on 2023-10-11.
//

import SwiftUI

struct ContentView: View {
    @State var isKeyboardLocked: Bool = false

    var body: some View {
        VStack {
            Text("Fuzzy - Keyboard Cleaning Tool")
                .padding()
                .font(.largeTitle)
            
            Text("Grant permissions to via System Settings > Privacy & Security > Accessibility")
                .padding()
            
            Image("systemsettings")
                .resizable()
                .frame(width: 400, height: 320)
                .padding()
                        
            Button(action: {
                isKeyboardLocked.toggle()
                if isKeyboardLocked {
                    createEventTap()
                } else {
                    disableEventTap()
                    }
                }) {
                    Text(isKeyboardLocked ? "Unlock Keyboard" : "Lock Keyboard")
                    }
                }
                .padding()
        HStack{
            Link("Give me feedback!", destination: URL(string: "https://www.carsonclark.dev")!)
                .padding()
        }
        
            }
        }

#Preview {
    ContentView()
}
