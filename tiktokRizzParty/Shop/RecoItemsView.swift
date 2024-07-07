//
//  RecoItemsView.swift
//  tiktokRizzParty
//
//  Created by Simantak Dabhade on 7/7/24.
//
import SwiftUI

// MARK: - SearchBar: View for displaying a search bar
struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchText)
                    .padding(.vertical, 10)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
    }
}

// MARK: - CategoryScrollView: View for displaying a horizontal scrollable list of categories
struct CategoryScrollView: View {
    let categories: [String]
    @Binding var selectedCategory: String?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 4) {
                ForEach(categories, id: \.self) { category in
                    CategoryCard(category: category, isSelected: category == selectedCategory)
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
        }
    }
}

// MARK: - CategoryCard: View for displaying an individual category card
struct CategoryCard: View {
    let category: String
    let isSelected: Bool

    var body: some View {
        Text(category)
            .fontWeight(.bold)
            .foregroundColor(isSelected ? .white : .gray)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(isSelected ? LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.0, green: 0.75, blue: 1.0), Color(red: 1.0, green: 0.0, blue: 0.5)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ) : LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.11, green: 0.11, blue: 0.14), Color(red: 0.25, green: 0.25, blue: 0.30)]),
                startPoint: .top,
                endPoint: .bottom
            ))
            .cornerRadius(10)
    }
}

// MARK: - RecoItemsView: View for displaying recommended items
struct RecoItemsView: View {
    @State private var selectedCategory: String? = nil
    @State private var searchText: String = ""
    let products: [Product]

    // Filter products based on selected category
    var filteredProducts: [Product] {
        if let selectedCategory = selectedCategory {
            return products.filter { $0.category == selectedCategory }
        } else {
            return products
        }
    }

    // Get unique categories from products
    var categories: [String] {
        Array(Set(products.map { $0.category })).sorted()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            // Recommendations Section
            Text("Recommendations")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
                .foregroundColor(.white)

            // Search bar
            SearchBar(searchText: $searchText)
                .padding(.vertical, 8.0)
                .padding(.horizontal, 8.0)

            // Category scroll view
            CategoryScrollView(categories: categories, selectedCategory: $selectedCategory)
                .padding(.vertical, 4.0)
                .padding(.bottom, 4.0)

            // Adaptive grid for displaying products
            let adaptiveColumns = [
                GridItem(.adaptive(minimum: 170))
            ]

            LazyVGrid(columns: adaptiveColumns, spacing: 12) {
                ForEach(filteredProducts, id: \.name) { product in
                    product_card_view(imageName: product.item, titleDescription: product.name, priceText: product.price)
                }
            }
        }
    }
}

// MARK: - Preview for RecoItemsView
struct RecoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}

