//
//  Menu.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 25/09/23.
//

import Foundation

struct Menu {
    static let shared = Menu() // Singleton instance
    
    // Define categories and their associated menu items
    private let categories: [Category] = [
        Category(
            name: "Entrees",
            description: "Start with our exquisite entrees, made to impress and delight your senses.",
            thumbnail: "entrees-background"
        ),
        Category(
            name: "Main Courses",
            description: "Indulge in a variety of mouthwatering main courses that are sure to delight your taste buds.",
            thumbnail: "main-courses-background"
        ),
        Category(
            name: "Drinks",
            description: "Explore our refreshing drink menu, featuring a range of beverages to quench your thirst and elevate your dining experience.",
            thumbnail: "drinks-background"
        ),
        Category(
            name: "Desserts",
            description: "Treat yourself to heavenly desserts that satisfy your cravings and add a sweet ending to your meal.",
            thumbnail: "desserts-background"
        )
    ]
    
    // Create menu items for each category
    private var menuItems: [String: [MenuItem]] = [:]
    
    // Initialize the menu with some sample items
    private init() {
        for category in categories {
            menuItems[category.name] = []
        }
        
        // Add menu items
        // Entreés
        menuItems["Entrees"]?.append(
            MenuItem(
                name: "Italian Bruschetta",
                category: "Entrees",
                description: "A classic Italian appetizer featuring toasted bread topped with ripe tomatoes, fresh basil, garlic, and drizzled with extra-virgin olive oil. A burst of Mediterranean flavors to start your meal.",
                price: 8.50,
                image: "italian-bruschetta"
            )
        )
        
        menuItems["Entrees"]?.append(
            MenuItem(
                name: "Greek Spanakopita",
                category: "Entrees",
                description: "Flaky phyllo pastry filled with a delightful mixture of spinach, feta cheese, onions, and herbs. Baked to perfection and served warm. A traditional Greek treat that's both savory and comforting.",
                price: 7.95,
                image: "greek-spanakopita"
            )
        )
        
        menuItems["Entrees"]?.append(
            MenuItem(
                name: "Turkish Sigara Borek",
                category: "Entrees",
                description: "Golden and crispy cigar-shaped pastries filled with a blend of feta cheese and parsley. Served with a tangy yogurt dip. A Turkish delight to indulge in.",
                price: 6.75,
                image: "turkish-sigara-borek"
            )
        )
        
        menuItems["Entrees"]?.append(
            MenuItem(
                name: "Italian Caprese Salad",
                category: "Entrees",
                description: "A refreshing Italian salad made with sliced mozzarella cheese, vine-ripened tomatoes, fresh basil leaves, and balsamic glaze. An ode to the Mediterranean summer.",
                price: 9.25,
                image: "italian-caprese-salad"
            )
        )
        
        menuItems["Entrees"]?.append(
            MenuItem(
                name: "Greek Mezze Platter",
                category: "Entrees",
                description: "A delectable assortment of traditional Greek mezze, including hummus, tzatziki, dolmades, kalamata olives, and pita bread. A great way to savor multiple Greek flavors in one dish.",
                price: 10.50,
                image: "greek-mezze-platter"
            )
        )
        
        menuItems["Entrees"]?.append(
            MenuItem(
                name: "Turkish Lentil Soup (Mercimek Çorbası)",
                category: "Entrees",
                description: "A heartwarming Turkish red lentil soup, seasoned with aromatic spices and served with a hint of lemon. A comforting bowl of goodness.",
                price: 6.50,
                image: "turkish-lentil-soup"
            )
        )
        
        // Main Courses
        menuItems["Main Courses"]?.append(
            MenuItem(
                name: "Italian Margherita Pizza",
                category: "Main courses",
                description: "A classic Italian pizza topped with San Marzano tomatoes, fresh mozzarella, basil leaves, and a drizzle of olive oil. Simple and delightful.",
                price: 12.95,
                image: "italian-margherita-pizza"
            )
        )
        
        menuItems["Main Courses"]?.append(
            MenuItem(
                name: "Greek Moussaka",
                category: "Main courses",
                description: "Layers of eggplant, spiced ground meat, and creamy béchamel sauce baked to perfection. A Greek comfort dish that's both hearty and flavorful.",
                price: 14.75,
                image: "greek-moussaka"
            )
        )
        
        menuItems["Main Courses"]?.append(
            MenuItem(
                name: "Turkish Lamb Kebabs",
                category: "Main courses",
                description: "Tender and succulent grilled lamb kebabs marinated in a blend of spices and served with fluffy rice and grilled vegetables. A Turkish delight for meat lovers.",
                price: 17.50,
                image: "turkish-lamb-kebabs"
            )
        )
        
        menuItems["Main Courses"]?.append(
            MenuItem(
                name: "Italian Chicken Piccata",
                category: "Main courses",
                description: "Sautéed chicken breasts in a lemon-caper sauce, served with buttery mashed potatoes and steamed vegetables. A zesty Italian favorite.",
                price: 16.25,
                image: "italian-chicken-piccata"
            )
        )
        
        menuItems["Main Courses"]?.append(
            MenuItem(
                name: "Greek Grilled Sea Bass",
                category: "Main courses",
                description: "Fresh sea bass seasoned with Mediterranean herbs, grilled to perfection, and served with lemon roasted potatoes. A taste of Greek coastal cuisine.",
                price: 19.95,
                image: "greek-grilled-sea-bass"
            )
        )
        
        menuItems["Main Courses"]?.append(
            MenuItem(
                name: "Turkish Vegetarian Imam Bayildi",
                category: "Main courses",
                description: "Stuffed eggplant with a flavorful mixture of tomatoes, onions, garlic, and herbs, then roasted until tender. Served with rice pilaf. A delightful Turkish vegan option.",
                price: 15.50,
                image: "turkish-vegetarian-imam-bayildi"
            )
        )
        
        // Drinks
        menuItems["Drinks"]?.append(
            MenuItem(
                name: "Italian Espresso",
                category: "Drinks",
                description: "A bold and rich Italian espresso shot. Perfect for coffee enthusiasts who love a strong kick.",
                price: 3.50,
                image: "italian-espresso"
            )
        )
        
        menuItems["Drinks"]?.append(
            MenuItem(
                name: "Greek Frappé",
                category: "Drinks",
                description: "A refreshing iced coffee made with instant coffee, sugar, and milk, shaken to frothy perfection. A popular Greek summer beverage.",
                price: 4.25,
                image: "greek-frappe"
            )
        )
        
        menuItems["Drinks"]?.append(
            MenuItem(
                name: "Turkish Ayran",
                category: "Drinks",
                description: "A traditional Turkish yogurt drink made with yogurt, water, and a pinch of salt. A cool and refreshing choice.",
                price: 3.75,
                image: "turkish-ayran"
            )
        )
        
        menuItems["Drinks"]?.append(
            MenuItem(
                name: "Italian Limoncello",
                category: "Drinks",
                description: "An Italian lemon liqueur known for its sweet and tangy flavor. Served chilled as a digestif.",
                price: 7.95,
                image: "italian-limoncello"
            )
        )
        
        menuItems["Drinks"]?.append(
            MenuItem(
                name: "Greek Ouzo",
                category: "Drinks",
                description: "A traditional Greek anise-flavored spirit, best enjoyed with water and ice. A taste of Greek tradition.",
                price: 6.50,
                image: "greek-ouzo"
            )
        )
        
        menuItems["Drinks"]?.append(
            MenuItem(
                name: "Turkish Delight Tea (Çay)",
                category: "Drinks",
                description: "A strong black tea brewed in the Turkish style, served in small tulip-shaped glasses. The essence of Turkish hospitality.",
                price: 3.00,
                image: "turkish-deligh-tea"
            )
        )
        
        // Desserts
        menuItems["Desserts"]?.append(
            MenuItem(
                name: "Italian Tiramisu",
                category: "Desserts",
                description: "A luscious Italian dessert made with layers of coffee-soaked ladyfingers and mascarpone cheese, dusted with cocoa. A heavenly treat.",
                price: 8.95,
                image: "italian-tiramisu"
            )
        )
        
        menuItems["Desserts"]?.append(
            MenuItem(
                name: "Greek Baklava",
                category: "Desserts",
                description: "A sweet Greek pastry made of layers of phyllo dough, nuts, and honey syrup. An indulgent and irresistible dessert.",
                price: 7.50,
                image: "greek-baklava"
            )
        )
        
        menuItems["Desserts"]?.append(
            MenuItem(
                name: "Turkish Kunefe",
                category: "Desserts",
                description: "A popular Turkish dessert made with shredded phyllo dough, sweet cheese, and syrup. Served warm and topped with crushed pistachios.",
                price: 9.25,
                image: "turkish-kunefe"
            )
        )
        
        menuItems["Desserts"]?.append(
            MenuItem(
                name: "Italian Cannoli",
                category: "Desserts",
                description: "Crispy pastry tubes filled with a creamy ricotta cheese and chocolate chip mixture. A delightful Italian classic.",
                price: 6.75,
                image: "italian-cannoli"
            )
        )
        
        menuItems["Desserts"]?.append(
            MenuItem(
                name: "Greek Loukoumades",
                category: "Desserts",
                description: "Light and fluffy Greek honey donuts, sprinkled with cinnamon and served with a drizzle of honey. Pure indulgence.",
                price: 7.25,
                image: "greek-loukoumades"
            )
        )
        
        menuItems["Desserts"]?.append(
            MenuItem(
                name: "Turkish Rice Pudding (Sütlaç)",
                category: "Desserts",
                description: "Creamy and aromatic rice pudding, delicately flavored with cinnamon. A comforting and delicious Turkish favorite.",
                price: 6.50,
                image: "turkish-rice-pudding"
            )
        )
    }
    
    func getCategories() -> [Category] {
        categories
    }
    
    // Get menu items for a specific category
    func getMenuItems(forCategory category: String) -> [MenuItem] {
        return menuItems[category] ?? []
    }
}

struct Category: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let thumbnail: String
}

struct MenuItem: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let description: String
    let price: Double
    let image: String
}
