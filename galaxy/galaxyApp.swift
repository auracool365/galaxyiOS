//
//  galaxyApp.swift
//  galaxy
//
//  Created by Cornelius Ohiani Mamman on 3/31/24.
//

import SwiftUI

@main
struct galaxyApp: App {
    
    @State var galaxy_detail = GalaxyDetail()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(galaxy_detail)
        }
    }
}
