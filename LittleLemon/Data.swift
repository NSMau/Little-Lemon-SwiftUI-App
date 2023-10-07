//
//  Data.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 6/10/23.
//

import Foundation

struct Data {
    static let littleLemonData = Data()
    
    let locations: [Location] = [
        Location(
            name: "North Las Vegas",
            address: LocationAddress(
                street: "2001 E Lake Mead Blvd",
                city: City.Vegas.rawValue,
                state: AddressState.NV.rawValue,
                zipCode: "89030"
            ),
            phoneNumber: "(702) 399-0654",
            mapCoordinates: MapCoordinates(latitude: 36.195419, longitude: -115.120442),
            amenities: [
                amenities["accessibleEntries"]!,
                amenities["airPurifier"]!,
                amenities["creditCards"]!,
                amenities["delivery"]!,
                amenities["parking"]!,
                amenities["toilet"]!,
                amenities["wifi"]!
            ]
        ),
        Location(
            name: "Rancho Charleston",
            address: LocationAddress(
                street: "3301 W Sahara Ave",
                city: City.Vegas.rawValue,
                state: AddressState.NV.rawValue,
                zipCode: "89102"
            ),
            phoneNumber: "(702) 280-2456",
            mapCoordinates: MapCoordinates(latitude: 36.144080, longitude: -115.185845),
            amenities: [
                amenities["accessibleEntries"]!,
                amenities["airPurifier"]!,
                amenities["creditCards"]!,
                amenities["parking"]!,
                amenities["toilet"]!,
                amenities["wifi"]!
            ]
        ),
        Location(
            name: "North Hollywood",
            address: LocationAddress(
                street: "138 S Central Ave",
                city: City.LA.rawValue,
                state: AddressState.CA.rawValue,
                zipCode: "90012"
            ),
            phoneNumber: "(213) 613-0393",
            mapCoordinates: MapCoordinates(latitude: 34.048023, longitude: -118.239117),
            amenities: [
                amenities["accessibleEntries"]!,
                amenities["creditCards"]!,
                amenities["delivery"]!,
                amenities["parking"]!,
                amenities["takeaway"]!,
                amenities["toilet"]!,
                amenities["wifi"]!
            ]
        ),
        Location(
            name: "Venice Crossroads",
            address: LocationAddress(
                street: "8985 Venice Blvd",
                city: City.LA.rawValue,
                state: AddressState.CA.rawValue,
                zipCode: "90034"
            ),
            phoneNumber: "(310) 558-0407",
            mapCoordinates: MapCoordinates(latitude: 34.027214, longitude: -118.392840),
            amenities: [
                amenities["accessibleEntries"]!,
                amenities["creditCards"]!,
                amenities["delivery"]!,
                amenities["parking"]!,
                amenities["takeaway"]!,
                amenities["toilet"]!,
                amenities["wifi"]!
            ]
        ),
        Location(
            name: "Cole Valley",
            address: LocationAddress(
                street: "350 Parnassus Ave",
                city: City.SF.rawValue,
                state: AddressState.CA.rawValue,
                zipCode: "94117"
            ),
            phoneNumber: "(415) 665-6406",
            mapCoordinates: MapCoordinates(latitude: 37.764120, longitude: -122.456341),
            amenities: [
                amenities["accessibleEntries"]!,
                amenities["creditCards"]!,
                amenities["delivery"]!,
                amenities["parking"]!,
                amenities["takeaway"]!,
                amenities["toilet"]!,
                amenities["wifi"]!
            ]
        ),
        Location(
            name: "Potrero Hill",
            address: LocationAddress(
                street: "350 Rhode Island St",
                city: City.SF.rawValue,
                state: AddressState.CA.rawValue,
                zipCode: "94103"
            ),
            phoneNumber: "(415) 864-6383",
            mapCoordinates: MapCoordinates(latitude: 37.765860, longitude: -122.403501),
            amenities: [
                amenities["accessibleEntries"]!,
                amenities["creditCards"]!,
                amenities["delivery"]!,
                amenities["parking"]!,
                amenities["takeaway"]!,
                amenities["toilet"]!,
                amenities["wifi"]!
            ]
        ),
    ]
    
    func getLocationNames() -> [String] {
        var locationNames: [String] = []
        
        for location in locations {
            locationNames.append(location.name)
        }
        
        return locationNames
    }
}

enum City: String {
    case LA = "Los Angeles"
    case SF = "San Francisco"
    case Vegas = "Las Vegas"
}

enum AddressState: String {
    case CA = "CA"
    case NV = "NV"
}

struct Location: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let address: LocationAddress
    let phoneNumber: String
    let hours = "11:00 AM - 11:00 PM"
    let mapCoordinates: MapCoordinates
    let amenities: [LocationAmenity]
}

struct MapCoordinates: Hashable, Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
}

struct LocationAddress: Hashable, Identifiable {
    let id = UUID()
    let street: String
    let city: String
    let state: String
    let zipCode: String
}

//enum LocationAmenity {
//    typealias RawValue = Amenity
//
//    case accessibleRampsAndDoors, airPurifier, creditCards, delivery, parking, takeaway, toilet, wifi
//
//}

/// Amenities
//let amenitiesData = [
//    ("Accessible Ramps and Doors", "figure.roll"),
//    ("Air Purifier", "air.purifier"),
//    ("Accepts Credit Cards", "creditcard.fill"),
//    ("Delivery", "shippingbox.fill"),
//    ("Parking", "parkingsign.circle"),
//    ("Takeaway", "takeoutbag.and.cup.and.straw.fill"),
//    ("Toilet Facilities", "checkmark"),
//    ("Free Wi-Fi", "wifi")
//]

// TODO: Refactor to simplify
//let accessibleRampsAndDoors = Amenity(name: "Accessible Ramps and Doors", sfSymbolName: "figure.roll")
//let airPurifier = Amenity(name: "Air Purifier", sfSymbolName: "air.purifier")
//let creditCards = Amenity(name: "Accepts Credit Cards", sfSymbolName: "creditcard.fill")
//let delivery = Amenity(name: "Delivery", sfSymbolName: "shippingbox.fill")
//let parking = Amenity(name: "Parking", sfSymbolName: "parkingsign.circle")
//let takeaway = Amenity(name: "Takeaway", sfSymbolName: "takeoutbag.and.cup.and.straw.fill")
//let toilet = Amenity(name: "Toilet Facilities", sfSymbolName: "checkmark")
//let wifi = Amenity(name: "Free Wi-Fi", sfSymbolName: "wifi")

let amenities = [
    "accessibleEntries": LocationAmenity(name: "Accessible Ramps and Doors", sfSymbolName: "figure.roll"),
    "airPurifier": LocationAmenity(name: "Air Purifier", sfSymbolName: "air.purifier"),
    "creditCards": LocationAmenity(name: "Accepts Credit Cards", sfSymbolName: "creditcard.fill"),
    "delivery": LocationAmenity(name: "Delivery", sfSymbolName: "shippingbox.fill"),
    "parking": LocationAmenity(name: "Parking", sfSymbolName: "parkingsign.circle"),
    "takeaway": LocationAmenity(name: "Takeaway", sfSymbolName: "takeoutbag.and.cup.and.straw.fill"),
    "toilet": LocationAmenity(name: "Toilet Facilities", sfSymbolName: "checkmark"),
    "wifi": LocationAmenity(name: "Free Wi-Fi", sfSymbolName: "wifi")
]

struct LocationAmenity: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let sfSymbolName: String
}
