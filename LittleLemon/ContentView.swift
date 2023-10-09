//
//  ContentView.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    enum Tab {
        case home, menu, reservation, locations, profile
    }
    
    @State var selectedTab: Tab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(Tab.home)
            MenuView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Menu")
                }
                .tag(Tab.menu)
            ReservationView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Reservation")
                }
                .tag(Tab.reservation)
                .environment(\.currentTab, $selectedTab)
            LocationsView()
                .tabItem {
                    Image(systemName: "location")
                    Text("Locations")
                }
                .tag(Tab.locations)
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(Tab.profile)
        }
    }
}

// Setup to enable switching tabs from child views
struct CurrentTabKey: EnvironmentKey {
    static var defaultValue: Binding<ContentView.Tab> = .constant(.home)
}

extension EnvironmentValues {
    var currentTab: Binding<ContentView.Tab> {
        get { self[CurrentTabKey.self] }
        set { self[CurrentTabKey.self] = newValue }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
