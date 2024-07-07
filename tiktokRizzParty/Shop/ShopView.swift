//
//  ShopView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 1/7/24.
//

import SwiftUI

// MARK: - Product Model
struct Product {
    let name: String
    let item: String
    let price: String
    let category: String // Category field added to the Product struct
}

// Sample product data
let products = [
    // Shirts
    Product(name: "Full sleeved graphite shirt - pure cotton", item: "T-Shirt 1", price: "24.99", category: "T-Shirts"),
    Product(name: "First Concept shirt, summer 24'", item: "T-Shirt 2", price: "28.00", category: "T-Shirts"),
    Product(name: "Zara Cotton Summer shirt", item: "T-Shirt 3", price: "69.99", category: "T-Shirts"),
    Product(name: "Custom Football jersey with your name! - Dri-Fit Blend", item: "T-Shirt 4", price: "69.99", category: "T-Shirts"),

    // Football shoes
    Product(name: "Adidas Predators Elite 10X", item: "boots1", price: "24.99", category: "Football Boots"),
    Product(name: "Phantom Viper Football shoes - CNY Sale", item: "boots2", price: "28.00", category: "Football Boots"),
    Product(name: "Nike Air Max Attack Soccer Cleats", item: "boots3", price: "69.99", category: "Football Boots"),
    Product(name: "Adidas Gold Edition Viper Elite IV", item: "fballboots1", price: "69.99", category: "Football Boots"),

    // Accessories
    Product(name: "Man City Football Cap - Official team merchandise", item: "Football Cap", price: "48.99", category: "Football Accessories"),
    Product(name: "Manchester United Football Keychain", item: "Football Keychain", price: "14.00", category: "Football Accessories"),
    Product(name: "2019 Nike Match football replica", item: "Football Nike", price: "69.99", category: "Football Accessories"),
]

// MARK: - ShopView: Main view for the shop
struct ShopView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Header for the shopping list
            ShoppingListHeader()

            // Scrollable content
            ScrollView {
                VStack(alignment: .leading) {
                    FilterContainer()
                        .padding(.bottom)
                    ShortlistView()
                        .padding(.horizontal, 6.0)
                    RecoItemsView(products: products)
                        .padding(.top)
                }
            }
        }
        .background(Color.black)
        .navigationBarHidden(true)
    }
}

// MARK: - ProductView: View for displaying an individual product
struct ProductView: View {
    var imageName: String
    var price: String

    var body: some View {
        VStack(alignment: .leading) {
            // Product image
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            // Product price
            Text(price)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// MARK: - RecommendedItemView: View for displaying a recommended item
struct RecommendedItemView: View {
    var imageName: String
    var title: String
    var price: String

    var body: some View {
        VStack {
            // Recommended item image
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
            // Recommended item title
            Text(title)
                .font(.headline)
            // Recommended item price
            Text(price)
                .font(.subheadline)
            Spacer()
            // Add to cart button
            Button(action: {}) {
                Image(systemName: "cart")
                    .padding()
            }
        }
        .frame(height: 200)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// MARK: - Preview for ShopView
#Preview {
    ShopView()
}
