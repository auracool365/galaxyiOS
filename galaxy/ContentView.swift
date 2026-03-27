//  ContentView.swift
//  galaxy
//
// Created by Cornelius Ohiani Mamman on 3/31/24.
//

import SwiftUI

struct ContentView: View {
    
    var galaxies: [Galaxy] = GalaxyDetail.myGalaxies
    
    @Namespace private var animation
    
    @State private var searchText = ""
    @State private var selectedGalaxy: Galaxy?
    
    var filteredGalaxies: [Galaxy] {
        if searchText.isEmpty {
            return galaxies
        }
        return galaxies.filter {
            $0.galaxyName.localizedCaseInsensitiveContains(searchText) ||
            $0.type.rawValue.localizedCaseInsensitiveContains(searchText) ||
            $0.constellation.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredGalaxies) { galaxy in
                    GalaxyRowView(galaxy: galaxy, namespace: animation)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.4)) {
                                selectedGalaxy = galaxy
                            }
                        }
                        .listRowBackground(backgroundColor)
                        .listRowSeparator(.visible)
                        .listRowSeparatorTint(Color.primary.opacity(0.15))
                        .listRowInsets(EdgeInsets(top: 0, leading: 6, bottom: 2, trailing: 2))
                }
            }
            .listStyle(.inset)
            .scrollContentBackground(.hidden)
            .background(backgroundColor)
            .searchable(text: $searchText, prompt: "Search galaxies, types, constellations…")
            
            .navigationTitle("Galaxies")
            .navigationBarTitleDisplayMode(.large)
            
            .navigationDestination(item: $selectedGalaxy) { galaxy in
                GalaxyDetailView(galaxy: galaxy, namespace: animation)
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "person.circle")
                            .font(.system(size: 20))
                    }
                }
            }
        }
        .preferredColorScheme(currentTheme)
    }
    
        // MARK: - Theme logic
    @AppStorage("appTheme") private var appTheme: String = AppTheme.system.rawValue
    
    var currentTheme: ColorScheme? {
        switch AppTheme(rawValue: appTheme) {
            case .light:
                return .light
            case .dark:
                return .dark
            default:
                return nil
        }
    }
    
    var backgroundColor: Color {
        currentTheme == .dark ? Color.black : Color(.systemBackground)
    }
    
    var rowBackgroundColor: Color {
        currentTheme == .dark ? Color.white.opacity(0.04) : Color(.secondarySystemBackground)
    }
}

#Preview {
    ContentView(galaxies: GalaxyDetail.myGalaxies)
}
