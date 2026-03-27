//
//  GalaxyRowView.swift
//  galaxy
//
//  Created by Cornelius Ohiani Mamman on 3/25/26.
//

import SwiftUI
 
struct GalaxyRowView: View {

    let galaxy: Galaxy
    let namespace: Namespace.ID   

    // Color badge for galaxy type
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
        HStack(spacing: 14) {

            // Thumbnail image
            ZStack(alignment: .bottomLeading) {
                Image(galaxy.imageName)
                    .resizable()
                    .scaledToFill()
                    .matchedGeometryEffect(id: galaxy.id, in: namespace)
                    .frame(width: 90, height: 90)
                    .clipped()
                    .cornerRadius(14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.primary.opacity(0.12), lineWidth: 1)
                    )

                // Galaxy-type badge
                Text(galaxy.type.rawValue)
                    .font(.system(size: 9, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 2)
                    .background(typeBadgeColor.opacity(0.85))
                    .cornerRadius(4)
                    .padding(6)
            }

            // Text details
            VStack(alignment: .leading, spacing: 5) {
                Text(galaxy.galaxyName)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.primary)

                Text(galaxy.constellation)
                    .font(.system(size: 13))
                    .fontWeight(.medium)
                    .foregroundStyle(.teal)

                HStack(spacing: 4) {
                    Image(systemName: "calendar.badge.clock")
                        .font(.system(size: 11))
                        .foregroundColor(.secondary)
                    Text(galaxy.discoveryDate)
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }

                HStack(spacing: 4) {
                    Image(systemName: "arrow.left.and.right")
                        .font(.system(size: 11))
                        .foregroundColor(.secondary)
                    Text(galaxy.distanceFromEarth)
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.primary.opacity(0.5))
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)

        // Apple Music-style card
        /*.background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.primary.opacity(0.05))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.primary.opacity(0.08))
        )
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)*/
    }
}

#Preview {
    @Previewable @Namespace var previewNamespace
    
    return GalaxyRowView(
        galaxy: Galaxy(
            galaxyName: "Sculptor",
            discoveryDate: "September 23, 1783",
            imageName: "Sculptor",
            type: .dwarf,
            distanceFromEarth: "290,000 ly",
            diameter: "~10,000 ly",
            numberOfStars: "~4 million",
            constellation: "Sculptor",
            description: "The Sculptor Galaxy (NGC 253)...",
            funFacts: [],
            discoveredBy: "Caroline Herschel"
        ),
        namespace: previewNamespace
    )
}
