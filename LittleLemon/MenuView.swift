//
//  MenuView.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 25/09/23.
//

import SwiftUI

struct MenuView: View {
    let screenDescription = (
        title: "Our Menu",
        subtitle: "We have a sea of options for your mediterranean taste."
    )
    
    var body: some View {
        NavigationView {
            VStack {
                ScreenHeadingView(heading: screenDescription.title, subheading: screenDescription.subtitle)
                
                ScrollView {
                    ForEach(Menu.shared.getCategories(), id: \.self) { category in
                        NavigationLink(destination: CategoryItemsView(
                            category: category, items: Menu.shared.getMenuItems(forCategory: category.name)
                        )) {
                            ZStack(alignment: .leading) {
                                Image(category.thumbnail)
                                    .cornerRadius(12)
                                    .frame(maxWidth: .infinity, minHeight: 128.0)
                                Text(category.name)
                                    .foregroundColor(Color("White"))
                                    .font(.custom("Phudu-SemiBold", size: 36))
                                    .padding(.leading, 48)
                                    .padding(.trailing, 24)
                            }
                        }
                    }
                }
                .padding(.top, 20)
            }
            .frame(alignment: .leading)
            .background(Color("Porcelain"))
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
