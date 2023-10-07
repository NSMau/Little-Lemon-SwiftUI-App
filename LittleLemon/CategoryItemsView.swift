//
//  CategoryItemsView.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 1/10/23.
//

import SwiftUI

struct CategoryItemsView: View {
    let category: Category
    let items: [MenuItem]
    
    var body: some View {
        VStack(spacing: 0) {
            ScreenHeadingView(heading: category.name, subheading: "")
            
            ScrollView {
                Text(category.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("MierB-Regular", size: 19))
                    .lineSpacing(6)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                
                ForEach(items, id: \.self) { item in
                    let formattedPrice = String(format: "%.2f", item.price)
                    
                    VStack(alignment: .leading) {
                        Image(item.image)
                            .resizable()
                            .frame(maxWidth: .infinity, minHeight: 256)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12)
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.custom("Phudu-SemiBold", size: 28))
                                .foregroundColor(Color("DeepSeaGreen"))
                                .padding(.bottom, 3)
                            Text(item.description)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.custom("MierB-Regular", size: 19))
                                .lineSpacing(6)
                                .padding(.bottom, 20)
                            HStack(alignment: .center) {
                                Text("$\(formattedPrice)")
                                    .font(.system(size: 17, design: .monospaced))
                                Spacer()
                                NavigationLink(
                                    destination: MenuItemView(item: item),
                                    label: { Label("Learn More", systemImage: "plus") }
                                )
                            }
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 0)
                    .padding(.bottom, 20)
                }
            }
            .padding(.top, 20)
            .background(Color("Porcelain"))
        }
    }
}

struct CategoryItemsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemsView(
            category: Category(
                name: "Entrees",
                description: "Start off with our exquisite entrees, made to impress and delight your senses.",
                thumbnail: "entrees-background"
            ),
            items: Menu.shared.getMenuItems(forCategory: "Entrees")
        )
    }
}
