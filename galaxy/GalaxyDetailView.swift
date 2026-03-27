//
//  GalaxyDetailView.swift
//  galaxy
//
//  Created by Cornelius Ohiani Mamman on 3/25/26.
//

import SwiftUI

import SwiftUI
 
// MARK: - Stat Tile
struct StatTile: View {
    let icon: String
    let label: String
    let value: String
 
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 13))
                    .foregroundColor(.blue)
                Text(label)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)
                    .tracking(0.5)
            }
            Text(value)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.primary.opacity(0.06))
        .cornerRadius(14)
    }
}
 
// MARK: - Galaxy Detail View
struct GalaxyDetailView: View {
 
    let galaxy: Galaxy
    let namespace: Namespace.ID
    @Environment(\.dismiss) private var dismiss
 
    var typeBadgeColor: Color {
        switch galaxy.type {
        case .spiral:      return .blue
        case .elliptical:  return .orange
        case .irregular:   return .purple
        case .lenticular:  return .teal
        case .dwarf:       return .green
        }
    }
 
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
 
            ScrollView {
                VStack(spacing: 0) {
 
                    // MARK: Hero Image
                    ZStack(alignment: .bottomLeading) {
                        GeometryReader { geo in
                            let y = geo.frame(in: .global).minY
                            let height = y > 0 ? 320 + y : 320
                            
                            Image(galaxy.imageName)
                                .resizable()
                                .scaledToFill()
                                .matchedGeometryEffect(id: galaxy.id, in: namespace)
                                .frame(
                                    width: geo.size.width,
                                    height: y > 0 ? 320 + y : 320
                                )
                                .offset(y: y > 0 ? -y : 0)
                            
                                // Gradient overlay for readability
                                LinearGradient(
                                    colors: [
                                        .black.opacity(0.6),
                                        .clear,
                                        .black.opacity(0.6)
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                .frame(width: geo.size.width, height: height)
                                .offset(y: y > 0 ? -y : 0)
                        }
                        .frame(height: 320)
                        //.clipped()
 
                        // Galaxy name + type over the hero
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(galaxy.type.rawValue.uppercased())
                                    .font(.system(size: 11, weight: .bold))
                                    .foregroundStyle(.primary)
                                    .tracking(1.5)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(typeBadgeColor.opacity(0.8))
                                    .cornerRadius(8)
                                Spacer()
                            }
 
                            Text(galaxy.galaxyName)
                                .font(.system(size: 36, weight: .bold, design: .default))
                                .foregroundColor(.white.opacity(0.9))
 
                            Text("Constellation: \(galaxy.constellation)")
                                .monospaced(true)
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundStyle(.teal/*.opacity(0.9)*/)
                                
                        }
                        .padding(18)
                        .padding(.bottom, 12)
                    }
                    .frame(height: 340)
 
                    // MARK: Content
                    VStack(alignment: .leading, spacing: 24) {
 
                        // Description
                        VStack(alignment: .leading, spacing: 5) {
                            SectionHeader(title: "About", icon: "info.circle")
 
                            Text(galaxy.description)
                                .font(.system(size: 15))
                                .fontWeight(.regular)
                                .foregroundColor(.primary.opacity(0.85))
                                .lineSpacing(4)
                        }
 
                        // Stats grid
                        VStack(alignment: .leading, spacing: 10) {
                            SectionHeader(title: "Key Statistics", icon: "chart.bar")
 
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 10) {
                                StatTile(icon: "calendar", label: "Discovered", value: galaxy.discoveryDate)
                                StatTile(icon: "person", label: "Discovered By", value: galaxy.discoveredBy)
                                StatTile(icon: "arrow.left.and.right", label: "Distance", value: galaxy.distanceFromEarth)
                                StatTile(icon: "circle.dashed", label: "Diameter", value: galaxy.diameter)
                                StatTile(icon: "star.fill", label: "Star Count", value: galaxy.numberOfStars)
                                StatTile(icon: "scope", label: "Constellation", value: galaxy.constellation)
                            }
                        }
 
                        // Fun Facts
                        VStack(alignment: .leading, spacing: 12) {
                            SectionHeader(title: "Fun Facts", icon: "lightbulb")
 
                            ForEach(galaxy.funFacts, id: \.self) { fact in
                                HStack(alignment: .top, spacing: 12) {
                                    Image(systemName: "sparkle")
                                        .font(.system(size: 13))
                                        .foregroundColor(.yellow)
                                        .padding(.top, 2)
                                    Text(fact)
                                        .font(.system(size: 14))
                                        .foregroundColor(.primary.opacity(0.8))
                                        .lineSpacing(4)
                                }
                                .padding(14)
                                .background(Color.primary.opacity(0.05))
                                .cornerRadius(12)
                            }
                        }
 
                        Spacer(minLength: 40)
                    }
                    .padding(18)
                    //.padding(.top, 2)
                    .background(Color(.systemBackground))
                    .cornerRadius(12, corners: [.topLeft, .topRight]) // curved edges
                    .offset(y: -26)
                }
            }
            .background(Color(.systemBackground))
            .ignoresSafeArea(edges: .top)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Galaxies")
                    }
                    .foregroundColor(.primary)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.primary.opacity(0.15))
                    .cornerRadius(20)
                }
            }
        }
    }
}
 
// MARK: - Section Header
struct SectionHeader: View {
    let title: String
    let icon: String
 
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.blue)
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    @Previewable @Namespace var galaxyNamespace
    GalaxyDetailView(galaxy: Galaxy(
        galaxyName: "Sculptor",
        discoveryDate: "September 23, 1783",
        imageName: "Sculptor",
        type: .dwarf,
        distanceFromEarth: "290,000 ly",
        diameter: "~10,000 ly",
        numberOfStars: "~4 million",
        constellation: "Sculptor",
        description: "The Sculptor Galaxy (NGC 253), also called the Silver Coin Galaxy, is one of the brightest and most easily observed galaxies from Earth. It is a starburst galaxy with very active star formation near its nucleus.",
        funFacts: [
            "One of the dustiest starburst galaxies known.",
            "Part of the Sculptor Group, the nearest galaxy group to the Local Group.",
            "Can be seen with binoculars from dark sites.",
            "Shows dramatic outflows of gas from its star-forming core."
        ],
        discoveredBy: "Caroline Herschel"
    ), namespace: galaxyNamespace)
}
