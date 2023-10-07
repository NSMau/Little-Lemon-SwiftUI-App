//
//  ContentView.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            MenuView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Menu")
                }
            ReservationView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Reservation")
                }
            LocationsView()
                .tabItem {
                    Image(systemName: "location")
                    Text("Locations")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
