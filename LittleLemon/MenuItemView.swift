//
//  MenuItemView.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 1/10/23.
//

import SwiftUI

struct MenuItemView: View {
    let item: MenuItem
    
    var body: some View {
        let formattedPrice = String(format: "%.2f", item.price)
        
        ZStack(alignment: .top) {
            Color("Porcelain")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.custom("Phudu-SemiBold", size: 30))
                    .foregroundColor(Color("DeepSeaGreen"))
                    .padding(.bottom, 3)
                Image(item.image)
                    .resizable()
                    .frame(maxWidth: .infinity, minHeight: 256)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                Text(item.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("MierB-Regular", size: 20))
                    .lineSpacing(6)
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                Text("$\(formattedPrice)")
                    .font(.system(size: 19, design: .monospaced))
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .background(Color("Porcelain"))
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(
            item: MenuItem(
                name: "Italian Bruschetta",
                category: "Entrees",
                description: "A classic Italian appetizer featuring toasted bread topped with ripe tomatoes, fresh basil, garlic, and drizzled with extra-virgin olive oil. A burst of Mediterranean flavors to start your meal.",
                price: 8.50,
                image: "italian-bruschetta"
            )
        )
    }
}

