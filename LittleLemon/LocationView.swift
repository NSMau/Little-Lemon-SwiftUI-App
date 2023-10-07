//
//  LocationView.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 6/10/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct LocationView: View {
    let location: Location
    
    var body: some View {
        @State var locationCoordinateRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: location.mapCoordinates.latitude,
                longitude: location.mapCoordinates.longitude
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        
        VStack() {
            ScreenHeadingView(
                heading: "\(location.name) — \(location.address.city), \(location.address.state)",
                subheading: ""
            )
            
            VStack(alignment: .leading) {
                List {
                    Section {
                        Text("")
                    }
                    .listRowBackground(Map(coordinateRegion: $locationCoordinateRegion))
                    .listRowInsets(EdgeInsets())
                    .frame(width: .infinity, height: 320)
                    
                    Section(header: Text("Address")) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(location.address.street)
                                .font(.custom("MierB-Regular", size: 21))
                                .padding(.bottom, 7)
                            Text("\(location.address.city), \(location.address.state), \(location.address.zipCode)")
                                .font(.custom("MierB-Regular", size: 17))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Section(header: Text("Hours")) {
                        Text(location.hours)
                            .font(.custom("MierB-Regular", size: 17))
                    }
                    
                    Section(header: Text("Amenities")) {
                        ForEach(location.amenities, id: \.self) { amenity in
                            HStack {
                                Image(systemName: amenity.sfSymbolName)
                                Text(amenity.name)
                                    .font(.custom("MierB-Regular", size: 18))
                            }
                        }
                    }
                    
                    // TODO: Temporarily using a `NavaigationLink` to go to the Reservation screen.
                    // This will be replaced by some logic that navigates to the Reservation tab
                    // programatically.
                    NavigationLink(
                        destination: ReservationView(),
                        label: {
                            Label("Book A Table", systemImage: "")
                                .font(.custom("Phudu-SemiBold", size: 20))
                                .frame(width: 360, height: 48)
                        }
                    )
                    .background(Color("DeepSeaGreen"))
                    // FIXME: foregroundColor is rendered with some sort of opacity
                    .foregroundColor(Color(.white))
                    .listRowInsets(EdgeInsets())
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
        .background(Color("Porcelain"))
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(location: Location(
            name: "Mission Bay",
            address: LocationAddress(
                street: "1700 Owens St",
                city: City.SF.rawValue,
                state: AddressState.CA.rawValue,
                zipCode: "94158"
            ),
            phoneNumber: "000000000",
            mapCoordinates: MapCoordinates(latitude: 37.765860, longitude: -122.403501),
            amenities: [
                amenities["accessibleEntries"]!,
                amenities["creditCards"]!,
                amenities["delivery"]!,
                amenities["parking"]!,
                amenities["takeaway"]!,
                amenities["toilet"]!,
                amenities["wifi"]!
            ])
        )
    }
}
