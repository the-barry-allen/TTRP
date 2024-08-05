//
//  ShopView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 1/7/24.
//

import SwiftUI

// MARK: - Product Model
struct Product: Identifiable {
    let id = UUID()
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
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }
}

// MARK: - RecommendedItemView: View for displaying a recommended item
struct RecommendedItemView: View {
    var product: Product

    var body: some View {
        HStack {
            // Recommended item image
            Image(product.item)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                // Recommended item title
                Text(product.name)
                    .font(.headline)
                    .foregroundColor(.white)
                // Recommended item price
                Text(product.price)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            Spacer()
            // Add to cart button
            Button(action: {}) {
                Image(systemName: "cart")
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// MARK: - ProductDetailView: View for displaying product details
struct ProductDetailView: View {
    var product: Product

    var body: some View {
        VStack(alignment: .leading) {
            // Product image
            Image(product.item)
                .resizable()
                .frame(height: 300)
                .cornerRadius(10)
            Text(product.name)
                .font(.largeTitle)
                .padding(.top)
            Text(product.price)
                .font(.title)
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(product.name), displayMode: .inline)
    }
}

// MARK: - Preview for ShopView
struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
