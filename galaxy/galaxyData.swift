//
//  galaxyData.swift
//  galaxy
//
//  Created by Cornelius Ohiani Mamman on 3/31/24.
//

import Foundation

// MARK: - Galaxy Type Enum
enum GalaxyType: String {
    case spiral = "Spiral"
    case elliptical = "Elliptical"
    case irregular = "Irregular"
    case lenticular = "Lenticular"
    case dwarf = "Dwarf"
}

// MARK: - Galaxy Model
struct Galaxy: Identifiable, Hashable {
    var id = UUID()
    var galaxyName: String
    var discoveryDate: String
    var imageName: String
    var type: GalaxyType
    var distanceFromEarth: String
    var diameter: String
    var numberOfStars: String
    var constellation: String
    var description: String
    var funFacts: [String]
    var discoveredBy: String
}

// MARK: - Galaxy Data
class GalaxyDetail: ObservableObject {

    static let myGalaxies: [Galaxy] = [

        Galaxy(
            galaxyName: "Andromeda",
            discoveryDate: "August 03, 1764",
            imageName: "Andromeda",
            type: .spiral,
            distanceFromEarth: "2.537 million ly",
            diameter: "220,000 ly",
            numberOfStars: "~1 trillion",
            constellation: "Andromeda",
            description: "The Andromeda Galaxy (M31) is the closest large galaxy to the Milky Way and the most distant object visible to the naked eye. It is on a collision course with our galaxy, expected to merge in about 4.5 billion years.",
            funFacts: [
                "It will collide with the Milky Way in ~4.5 billion years.",
                "Contains roughly 1 trillion stars — twice as many as the Milky Way.",
                "Has at least 26 satellite galaxies.",
                "Visible to the naked eye on a clear, dark night."
            ],
            discoveredBy: "Simon Marius"
        ),

        Galaxy(
            galaxyName: "Milky Way",
            discoveryDate: "Ancient (recorded ~1610)",
            imageName: "MilkyWay",
            type: .spiral,
            distanceFromEarth: "0 (Our home galaxy)",
            diameter: "105,700 ly",
            numberOfStars: "100–400 billion",
            constellation: "Sagittarius (center)",
            description: "The Milky Way is the galaxy containing our Solar System. It is a barred spiral galaxy with a diameter of about 105,700 light-years. Earth is located about 26,000 light-years from the galactic center.",
            funFacts: [
                "Our Sun takes ~225 million years to orbit the galactic center.",
                "The supermassive black hole at its center is called Sagittarius A*.",
                "It has four major spiral arms.",
                "The galaxy is estimated to be 13.6 billion years old."
            ],
            discoveredBy: "Galileo Galilei (resolved into stars)"
        ),

        Galaxy(
            galaxyName: "Triangulum",
            discoveryDate: "1654",
            imageName: "Triangulum",
            type: .spiral,
            distanceFromEarth: "2.73 million ly",
            diameter: "60,000 ly",
            numberOfStars: "~40 billion",
            constellation: "Triangulum",
            description: "The Triangulum Galaxy (M33) is the third-largest member of the Local Group of galaxies, after the Milky Way and Andromeda. It is one of the most distant objects visible to the naked eye under very dark skies.",
            funFacts: [
                "It is the smallest spiral galaxy in the Local Group.",
                "Has one of the largest known H II regions, NGC 604.",
                "May be a satellite of the Andromeda Galaxy.",
                "Possibly visible with the naked eye — but only from very dark skies."
            ],
            discoveredBy: "Giovanni Battista Hodierna"
        ),

        Galaxy(
            galaxyName: "Whirlpool",
            discoveryDate: "October 13, 1773",
            imageName: "Whirlpool",
            type: .spiral,
            distanceFromEarth: "23 million ly",
            diameter: "76,900 ly",
            numberOfStars: "~160 billion",
            constellation: "Canes Venatici",
            description: "The Whirlpool Galaxy (M51a) is a grand-design spiral galaxy famous for its striking arms and its interaction with the smaller galaxy NGC 5195. It was the first galaxy to be classified as a spiral galaxy.",
            funFacts: [
                "It was the first galaxy classified as a spiral (1845).",
                "Currently interacting gravitationally with NGC 5195.",
                "Has an active nucleus — a Seyfert 2 galaxy.",
                "A favorite target for amateur astronomers."
            ],
            discoveredBy: "Charles Messier"
        ),

        Galaxy(
            galaxyName: "Sombrero",
            discoveryDate: "May 11, 1781",
            imageName: "Sombrero",
            type: .lenticular,
            distanceFromEarth: "31.1 million ly",
            diameter: "50,000 ly",
            numberOfStars: "~800 billion",
            constellation: "Virgo",
            description: "The Sombrero Galaxy (M104) is named for its resemblance to a Mexican hat. It has an unusually large central bulge and a prominent dust lane that gives it its distinctive hat-like shape.",
            funFacts: [
                "Has one of the largest known supermassive black holes (~1 billion solar masses).",
                "Its bulge is unusually large for a galaxy of its size.",
                "Ranked 53rd on NASA Hubble's top-100 most beautiful images.",
                "Has a large population of globular clusters (~2,000)."
            ],
            discoveredBy: "Pierre Méchain"
        ),

        Galaxy(
            galaxyName: "Cartwheel",
            discoveryDate: "1941",
            imageName: "Cartwheel",
            type: .irregular,
            distanceFromEarth: "500 million ly",
            diameter: "150,000 ly",
            numberOfStars: "~1 billion",
            constellation: "Sculptor",
            description: "The Cartwheel Galaxy is a lenticular ring galaxy that was formed by a high-velocity collision between a large spiral galaxy and a smaller galaxy. The distinctive ring was caused by a shockwave of star formation.",
            funFacts: [
                "Formed by a direct collision with another galaxy ~200 million years ago.",
                "The outer ring is expanding at ~100 km per second.",
                "James Webb Space Telescope imaged it in 2022.",
                "Contains regions of intense star formation."
            ],
            discoveredBy: "Fritz Zwicky"
        ),

        Galaxy(
            galaxyName: "Black Eye",
            discoveryDate: "March 23, 1779",
            imageName: "BlackEye",
            type: .spiral,
            distanceFromEarth: "17 million ly",
            diameter: "53,500 ly",
            numberOfStars: "~100 billion",
            constellation: "Coma Berenices",
            description: "The Black Eye Galaxy (M64) gets its dramatic name from the thick band of dark dust in front of its bright nucleus. Strangely, its inner disk rotates in the opposite direction from its outer disk.",
            funFacts: [
                "Its inner and outer gas disks rotate in opposite directions.",
                "The dark band is a result of a galaxy merger billions of years ago.",
                "Also known as the 'Sleeping Beauty Galaxy'.",
                "The counter-rotation causes intense star formation at the boundary."
            ],
            discoveredBy: "Edward Pigott"
        ),

        Galaxy(
            galaxyName: "Pinwheel",
            discoveryDate: "March 27, 1781",
            imageName: "Pinwheel",
            type: .spiral,
            distanceFromEarth: "20.9 million ly",
            diameter: "170,000 ly",
            numberOfStars: "~1 trillion",
            constellation: "Ursa Major",
            description: "The Pinwheel Galaxy (M101) is a face-on spiral galaxy with a relatively high abundance of HII regions where star formation occurs. It is asymmetric due to tidal forces from nearby galaxies.",
            funFacts: [
                "It is nearly twice the diameter of the Milky Way.",
                "Hosted three observed supernovae in modern times.",
                "Has over 3,000 HII star-forming regions.",
                "Forms part of the M101 Group of galaxies."
            ],
            discoveredBy: "Pierre Méchain"
        ),

        Galaxy(
            galaxyName: "Cigar (M82)",
            discoveryDate: "December 31, 1774",
            imageName: "Cigar",
            type: .irregular,
            distanceFromEarth: "11.4 million ly",
            diameter: "37,000 ly",
            numberOfStars: "~30 billion",
            constellation: "Ursa Major",
            description: "The Cigar Galaxy (M82) is a starburst galaxy five times more luminous than the Milky Way. It is undergoing a fierce burst of star formation due to its interaction with the nearby M81 galaxy.",
            funFacts: [
                "Its star-formation rate is 10x higher than the Milky Way.",
                "A superwind of hot gas blows out from its center.",
                "The nearest starburst galaxy to Earth.",
                "Produces a superwind visible in X-rays."
            ],
            discoveredBy: "Johann Elert Bode"
        ),

        Galaxy(
            galaxyName: "Centaurus A",
            discoveryDate: "April 29, 1826",
            imageName: "CentaurusA",
            type: .elliptical,
            distanceFromEarth: "13.7 million ly",
            diameter: "60,000 ly",
            numberOfStars: "~100 billion",
            constellation: "Centaurus",
            description: "Centaurus A (NGC 5128) is one of the closest radio galaxies to Earth, featuring a prominent dark dust lane across its center. It hosts a supermassive black hole ejecting powerful jets of particles at nearly the speed of light.",
            funFacts: [
                "One of the strongest radio sources in the sky.",
                "Has jets of plasma extending ~13,000 light-years.",
                "Likely formed by merging of an elliptical and spiral galaxy.",
                "Its central black hole is ~55 million solar masses."
            ],
            discoveredBy: "James Dunlop"
        ),

        Galaxy(
            galaxyName: "Large Magellanic Cloud",
            discoveryDate: "Ancient (documented ~1519)",
            imageName: "LargeMagellanicCloud",
            type: .irregular,
            distanceFromEarth: "163,000 ly",
            diameter: "14,000 ly",
            numberOfStars: "~30 billion",
            constellation: "Dorado / Mensa",
            description: "The Large Magellanic Cloud (LMC) is an irregular satellite galaxy of the Milky Way and one of the nearest galaxies to us. It is visible as a detached part of the Milky Way in the southern hemisphere sky.",
            funFacts: [
                "Visible to the naked eye from the Southern Hemisphere.",
                "Contains the Tarantula Nebula, the most active star-forming region nearby.",
                "Supernova 1987A, the closest supernova in centuries, occurred here.",
                "It orbits the Milky Way and may eventually be absorbed."
            ],
            discoveredBy: "Ferdinand Magellan (western record)"
        ),

        Galaxy(
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
        )
    ]
}
