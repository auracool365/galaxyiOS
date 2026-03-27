//
//  SettingsView.swift
//  galaxy
//
//  Created by Cornelius Ohiani Mamman on 3/25/26.
//

import SwiftUI

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("appTheme") private var appTheme: String = AppTheme.system.rawValue
    
    var body: some View {
        Form {
            Section(header: Text("Appearance")) {
                
                Picker("Theme", selection: $appTheme) {
                    Text("System").tag(AppTheme.system.rawValue)
                    Text("Light").tag(AppTheme.light.rawValue)
                    Text("Dark").tag(AppTheme.dark.rawValue)
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Settings")
    }
}
