//
//  ScreenHeadingView.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 26/09/23.
//

import SwiftUI

struct ScreenHeadingView: View {
    let heading: String
    let subheading: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(heading)
                .font(.custom("Phudu-SemiBold", size: 36))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color("DeepSeaGreen"))
                .padding(.bottom, 1)
            Text(subheading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.custom("MierB-Regular", size: 20))
                .lineSpacing(6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 24)
        .padding(.trailing, 24)
        .padding(.vertical, 16)
        .background(Color("Yellow"))
    }
}

struct ScreenHeadingView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenHeadingView(heading: "Heading", subheading: "Subheading")
    }
}
