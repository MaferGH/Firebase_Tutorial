//
//  FirebaseApp.swift
//  Firebase
//
//  Created by Fernanda García on 23/03/26.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct FirebaseTutorialApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
           ContentView()
                .environmentObject(dataManager)
        }
    }
}
