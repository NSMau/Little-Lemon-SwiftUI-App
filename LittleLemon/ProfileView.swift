//
//  ProfileView.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 25/09/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 0) {
            ScreenHeadingView(heading: "Profile", subheading: "Manage your account.")
            ZStack {
                Color("Porcelain")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "info.bubble.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 40))
                        .padding(.bottom, 2)
                    Text("Unimplemented")
                        .font(.custom("MierB-Bold", size: 24))
                        .padding(.bottom, 4)
                    Text("We're sorry. This feature is not available for the current app version.")
                        .font(.custom("MierB-Regular", size: 20))
                        .lineSpacing(8)
                }
                .padding(20)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
