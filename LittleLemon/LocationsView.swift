//
//  LocationsView.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 25/09/23.
//

import SwiftUI

struct LocationsView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ScreenHeadingView(heading: "Locations", subheading: "Find your nearest Little Lemon.")
                List {
                    ForEach(Data.littleLemonData.locations, id: \.self) { location in
                        NavigationLink(destination: LocationView(location: location)) {
                            VStack(alignment: .leading) {
                                Text(location.name)
                                    .font(.custom("MierB-Regular", size: 23))
                                    .padding(.bottom, 1)
                                Text("\(location.address.city) — \(location.phoneNumber)")
                                    .font(.custom("MierB-Regular", size: 16))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
